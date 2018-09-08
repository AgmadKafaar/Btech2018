FROM microsoft/aspnetcore:2.0-nanoserver-1709 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0-nanoserver-1709 AS build
WORKDIR /src
COPY Gentrifcation.MachineLearning.Api/Gentrifcation.MachineLearning.Api.csproj Gentrifcation.MachineLearning.Api/
RUN dotnet restore Gentrifcation.MachineLearning.Api/Gentrifcation.MachineLearning.Api.csproj
COPY . .
WORKDIR /src/Gentrifcation.MachineLearning.Api
RUN dotnet build Gentrifcation.MachineLearning.Api.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Gentrifcation.MachineLearning.Api.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Gentrifcation.MachineLearning.Api.dll"]
