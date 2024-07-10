# Cross-compile Intel's x86-64/i386 architecture 
FROM amd64/ubuntu:20.04

# Install necessary packages for compiling
RUN apt-get update && \
    apt-get install -y \
        gcc \
        g++ \
        gcc-multilib \
        g++-multilib \
        && \
    rm -rf /var/lib/apt/lists/*

# Set up a non-root user (optional, but recommended)
RUN useradd -ms /bin/bash devuser

# Switch to the non-root user
USER devuser
WORKDIR /home/devuser

# Docker build and run commands
# docker build -t ubuntu-dev .
# docker run -it -v $(pwd):/home/devuser ubuntu-dev


# Replace with your build commands (e.g., make, gcc)
# Example commands:
# RUN gcc -m32 -o myprogram32 myprogram.c
# RUN gcc -o myprogram64 myprogram.c

# Command to run when the container starts
CMD ["/bin/bash"]

