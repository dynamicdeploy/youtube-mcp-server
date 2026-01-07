FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm install

# Copy application source code
COPY src ./src

# Build the application
RUN npm run build

# Use the CLI entry point (which is the proper entry point for MCP servers)
ENTRYPOINT ["node", "dist/cli.js"]