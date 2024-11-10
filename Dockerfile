# Use the official Node-RED image based on Alpine Linux
FROM nodered/node-red:latest

# Switch to root user to install packages
USER root

# Install ffmpeg in the Alpine-based container
RUN apk update && apk add --no-cache ffmpeg

# Switch back to the default user (optional)
USER node-red

WORKDIR /data
COPY ./data/package.json /data

RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
WORKDIR /usr/src/node-red

# COPY ./data/settings.js /data/settings.js
# COPY ./data/flows_cred.json /data/flows_cred.json
# COPY ./data/flows.json /data/flows.json

# Expose the default Node-RED port
EXPOSE 1880

# Run Node-RED when the container starts
CMD ["npm", "start"]
