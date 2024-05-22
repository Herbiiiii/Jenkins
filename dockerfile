# Use the official Microsoft .NET image.
# https://hub.docker.com/r/microsoft/dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Copy everything and build
WORKDIR /app
COPY . ./
RUN dotnet publish -c Release -o out

# Final stage/image
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "yourapp.dll"]