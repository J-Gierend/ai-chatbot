# Use the official Node.js 20 image as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of your app's source code
COPY . .

# Build your Next.js app
RUN pnpm build

# Expose the port Next.js runs on
EXPOSE 3000

# Start the app
CMD ["pnpm", "start"]
