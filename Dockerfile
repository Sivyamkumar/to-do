# Base Image
FROM node:trixie-slim

# Use a different path to avoid folder name collisions
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy everything from your project into the container
COPY . .

# Expose the port
EXPOSE 3000

# Start the Node.js app
CMD ["node", "server.js"]