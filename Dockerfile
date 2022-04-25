FROM mcr.microsoft.com/dotnet/sdk:6.0.202-bullseye-slim

RUN apt-get update \
    && apt-get install --yes openjdk-11-jre

# Install NodeJs
RUN wget https://deb.nodesource.com/setup_16.x \
    && bash setup_16.x \
    && apt-get install -y nodejs

# install sonar
RUN dotnet tool install --global dotnet-sonarscanner

# clean-up
RUN apt-get -q autoremove \
    && apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin
