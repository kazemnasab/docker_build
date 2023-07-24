# Use the ubuntu:last image as the base image
FROM ubuntu:latest

# Update the package lists and install essential build tools
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get clean

# Copy the C program into the container
COPY hello.c /usr/src/

# Set the working directory
WORKDIR /usr/src/

# Compile the C program
RUN gcc -o hello hello.c

# Remove the build tools to reduce image size
RUN apt-get remove -y gcc && \
    apt-get autoremove -y && \
    apt-get clean

# Execute the C program when the container starts
COPY entrypoint.sh /usr/src/

# Make the entrypoint script executable
RUN chmod +x /usr/src/entrypoint.sh

# Set the entrypoint as the command to be executed when the container starts
CMD ["/usr/src/entrypoint.sh"]