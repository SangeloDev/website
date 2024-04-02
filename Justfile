# settings
set dotenv-load

# defaults
default_runner := 'docker'
default_tag := 'latest'
default_image := 'gitpot.dev/sangelo/website:latest'

# run development server by default
default: dev

# aliases
alias c := clean
alias b := build
alias r := run
alias d := dev
alias p := preview

# building

# run all docker related recipes (clean, build, run) (default runner: docker)
all tag=default_tag runner=default_runner:
    just -f {{justfile()}} clean {{runner}} {{tag}}
    just -f {{justfile()}} build {{tag}} {{runner}}
    just -f {{justfile()}} run {{tag}} {{runner}}

# clean containers, images and temporary svelte dirs with specified runner (default runner: docker)
clean runner=default_runner tag=default_tag:
    @echo "Cleaning dev environment..."
    rm -rf build/ .svelte-kit/
    @echo "Cleaning containers with '{{runner}}'..."
    TAG="{{tag}}" {{runner}} compose -f docker-compose.build.yml down
    @echo "Cleaning images with '{{runner}}'..."
    just -f {{justfile()}} _clean_images {{runner}}

# clean images function
_clean_images runner=default_runner:
    #!/usr/bin/env bash
    set -o pipefail
    image_ids=$({{runner}} image ls | grep gitpot.dev/sangelo/website | awk '{print $3}')
    if [ -n "$image_ids" ]; then
        for image_id in $image_ids; do
            {{runner}} image rm $image_id
            echo "Image with ID $image_id deleted successfully."
        done
    else
        echo "No images matching the repository and tag found."
    fi

# build container image with specified runner (default runner: docker)
build tag=default_tag runner=default_runner:
    @echo "Running with '{{runner}}' and tagging as '{{tag}}'..."
    TAG="{{tag}}" {{runner}} compose -f docker-compose.build.yml build --no-cache

# run container image with specified runner (default runner: docker)
run tag=default_tag runner=default_runner:
    @echo "Running with '{{runner}}'..."
    TAG={{tag}} {{runner}} compose -f docker-compose.build.yml up -d --force-recreate
    @# watch -n 1 {{runner}} compose -f docker-compose.build.yml ps

publish image=default_image runner=default_runner:
    @echo "Publishing with '{{runner}}'..."
    @# log into gitpot
    {{runner}} login gitpot.dev -u $GITPOT_USERNAME -p $GITPOT_PASSWORD
    @# push the specified image to the container registry
    {{runner}} push {{image}}
    @echo "Published {{image}} successfuly! Use '{{runner}} pull {{image}}' to pull the container."

# development

# install dependencies
_install:
    yarn install

# run vite dev server
dev: _install
    @echo "Running vite development server..."
    yarn run dev --open

# run vite preview server
preview: _install
    @echo "Running vite preview server..."
    yarn run build
    yarn run preview --open
