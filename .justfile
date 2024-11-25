image:
    bundle exec jekyll build
    docker build -t blog .
    docker buildx build --platform linux/amd64 -t collinvandyck/blog .

serve:
    bundle exec jekyll serve --open-url

serve-docker: image
    docker run --rm -p 8080:8080 blog

push: image
    docker push collinvandyck/blog

deploy: push
