# Makefile for building and running an OCaml project with Dune

# Default target: builds and runs the project
all: build run

# Build the project using Dune
build:
	@dune build

# Run the project using Dune's exec command
run:
	@dune exec ./compiler/main.exe

# Clean the project using Dune
clean:
	dune clean

# Rebuild the project (clean + build)
rebuild: clean build
