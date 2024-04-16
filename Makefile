.PHONY: run build clean help commit

run:
	@echo "Running the program..."
	@hugo server -D

build:
	@echo "Building the program..."
	@hugo

clean:
	@echo "Cleaning the program..."
	@rm -rf public

help:
	@echo "Usage: make [run|build|clean|help]"
	@echo "run: Run the program"
	@echo "build: Build the program"
	@echo "clean: Clean the program"
	@echo "help: Show this help message"

commit:
	@echo "Committing the changes..."
	sh deploy.sh
