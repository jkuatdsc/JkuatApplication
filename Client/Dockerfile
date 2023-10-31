# Use an official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json  ./

# Install dependencies
RUN npm install

# Copy the built app files to the working directory
COPY . .

# Build the React app (replace 'build' with your Vite build command)
#RUN npm run build

# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "run", "dev"]
