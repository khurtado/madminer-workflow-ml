#### Base image
#### Reference: https://github.com/diana-hep/madminer/blob/master/Dockerfile
FROM madminertool/docker-madminer:latest


#### Install binary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git


#### Set working directory
WORKDIR /madminer

#### Copy files
COPY code ./code
COPY data ./data
COPY scripts ./scripts
COPY MLproject requirements.txt ./


# Install Python3 dependencies
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir --requirement requirements.txt
