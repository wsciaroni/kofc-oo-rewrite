FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy protobuf schemas to /src/protos/ so that ../../protos resolves correctly
COPY protos/ /src/protos/
COPY applications/backend/backend.csproj applications/backend/
RUN dotnet restore applications/backend/backend.csproj

# Copy remaining backend source code and compile
COPY applications/backend/ applications/backend/
WORKDIR /src/applications/backend
RUN dotnet publish -c Release -o /app

# Final runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app .
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
ENTRYPOINT ["dotnet", "backend.dll"]
