image_name := "ghcr.io/collinvandyck/blog"

serve:
    bundle exec jekyll serve --open-url

image:
    bundle exec jekyll build
    docker build -t blog .
    docker buildx build --platform linux/amd64 -t {{ image_name }} .

serve-docker: image
    docker run --rm -p 8080:8080 blog

push: image
    docker push {{ image_name }}

# this is the one that does everything.
deploy: push
    #!/usr/bin/env bash
    cd ../containers/host/vps
    source .envrc
    just deploy-blog
