IMAGE_NAME=latex-env
CONTAINER_NAME=latex-container

# Build command
# Usage: make build
build:
	docker build -t $(IMAGE_NAME) .

# Run command
# Usage: make run
run:
	docker run -dit -v ${CURDIR}:/workdir --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop command
# Usage: make stop
stop:
	-docker stop $(CONTAINER_NAME)

# Remove command
# Usage: make remove
remove:
	-docker rm $(CONTAINER_NAME)

# Compile command
# Usage: make compile FILE=sample.tex
compile:
	docker exec $(CONTAINER_NAME) latexmk $(FILE)

# Clean command
# Usage: make clean
clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.synctex.gz *.dvi
