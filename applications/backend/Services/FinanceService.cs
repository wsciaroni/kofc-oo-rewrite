using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using Kofc.Finance.V1;
using Google.Type;

namespace backend.Services
{
    public class FinanceService : Kofc.Finance.V1.FinanceService.FinanceServiceBase
    {
        private readonly AppDbContext _dbContext;

        public FinanceService(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public override async Task<TransactionResponse> RecordTransaction(TransactionRequest request, ServerCallContext context)
        {
            decimal decimalAmount = 0;
            if (request.Amount != null)
            {
                decimalAmount = request.Amount.Units + (decimal)request.Amount.Nanos / 1000000000m;
            }

            var txId = Guid.NewGuid().ToString();

            var newTx = new Transaction
            {
                Id = txId,
                CouncilId = request.CouncilId,
                Type = request.Type == TransactionType.Income ? "INCOME" : "EXPENSE",
                Amount = decimalAmount,
                Description = request.Description,
                CheckNumber = string.IsNullOrWhiteSpace(request.CheckNumber) ? null : request.CheckNumber,
                LinkedMemberId = request.LinkedMemberId != 0 ? request.LinkedMemberId : null,
                CreatedAt = DateTime.UtcNow
            };

            _dbContext.Transactions.Add(newTx);

            // If it's a dues payment, also update the member's dues status
            if (request.LinkedMemberId != 0 && request.Type == TransactionType.Income)
            {
                var member = await _dbContext.Members.FindAsync(request.LinkedMemberId);
                if (member != null)
                {
                    member.IsPaid = true;
                }
            }

            await _dbContext.SaveChangesAsync();

            return new TransactionResponse
            {
                Success = true,
                TransactionId = txId
            };
        }

        public override async Task<DuesUpdateResponse> UpdateDuesStatus(DuesUpdateRequest request, ServerCallContext context)
        {
            // First find the member by ID or by member number. In the request we have member_id (int)
            var member = await _dbContext.Members.FindAsync(request.MemberId);
            if (member == null)
            {
                // Fallback check if it was mapped to member number or database ID
                member = await _dbContext.Members.FirstOrDefaultAsync(m => m.Id == request.MemberId);
            }

            if (member == null)
            {
                return new DuesUpdateResponse { Success = false };
            }

            member.IsPaid = request.IsPaid;
            await _dbContext.SaveChangesAsync();

            return new DuesUpdateResponse { Success = true };
        }
    }
}
