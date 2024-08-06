GOFILE := gocommit.go
OUTFILE := gocommit

# Target to build for different architectures
build-amd64-linux: version go_mod
	GOARCH=amd64 GOOS=linux go build -o $(OUTFILE)-amd64-linux 

build-arm64-linux: version go_mod
	GOARCH=arm64 GOOS=linux go build -o $(OUTFILE)-arm64-linux 

build-amd64-windows: version go_mod
	GOARCH=amd64 GOOS=windows go build -o $(OUTFILE)-amd64-windows.exe 

# Target to build all architectures
build: build-amd64-linux build-arm64-linux build-amd64-windows
	@echo "All binaries built successfully."

go_mod:
	@go mod init gocommit.go

# Target to run the program
run:
	@if [ "$(OUTFILE)" = "gocommit" ]; then ./$(OUTFILE); \
	else echo "Run target not supported for this architecture"; fi

# Target to clean up
clean:
	rm -rf $(OUTFILE) $(OUTFILE)-amd64-linux $(OUTFILE)-arm64-linux $(OUTFILE)-amd64-windows.exe version.go go.mod

# Target to print help
help:
	@echo "Makefile targets:"
	@echo "  build      : Builds the binary"
	@echo "  run        : Runs the program"
	@echo "  clean      : Cleans up the binaries and version file"
	@echo "  help       : Prints this message"
	@echo "  build-amd64-linux  : Builds for amd64 linux"
	@echo "  build-arm64-linux   : Builds for arm64 linux"
	@echo "  build-amd64-windows : Builds for amd64 windows"

# Generate version.go file
version:
	@echo "package main" > version.go
	@echo >> version.go
	@echo "const Version = \"$(shell git describe --tags || echo 'unknown' )-$(shell git rev-parse --short HEAD)\"" >> version.go

.PHONY: build run clean help build-amd64-linux build-arm64-linux build-amd64-windows version go_mod
.DEFAULT_GOAL := build
