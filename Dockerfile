FROM python:3.9.2-slim-buster  

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive  

# Create bot directory
RUN mkdir /bot && chmod 777 /bot  
WORKDIR /bot  

# Update packages and install dependencies  
RUN apt update -qq && apt install -y --no-install-recommends \  
    git wget pv jq python3-dev ffmpeg mediainfo neofetch  

# Copy project files  
COPY . .  

# Install Python dependencies  
RUN pip3 install --no-cache-dir -r requirements.txt  

# Expose port 8000 for health check  
EXPOSE 8000  

# Run the bot  
CMD ["bash", "run.sh"]
