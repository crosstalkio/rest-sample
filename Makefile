PROTOS := $(wildcard *.proto)
PBGO := $(PROTOS:.proto=.pb.go)

EXEC := sample
GOFILES := go.mod $(wildcard *.go) $(wildcard */*.go)

all: $(EXEC)

include .make/golangci-lint.mk
include .make/protoc.mk
include .make/protoc-gen-go.mk

tidy: $(PBGO)
	go mod tidy

lint: $(GOLANGCI_LINT)
	$(realpath $(GOLANGCI_LINT)) run

$(EXEC): $(PBGO) $(GOFILES)
	go build -o $@

clean/proto:
	rm -f $(PBGO)

clean: clean/golangci-lint clean/protoc clean/protoc-gen-go clean/proto
	rm -f go.sum
	rm -f $(EXEC)

test: # -count=1 disables cache
	go test -v -race -count=1

serve:
	go run .

.PHONY: all tidy lint clean test serve
