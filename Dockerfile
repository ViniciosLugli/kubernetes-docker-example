FROM rust:1.77 as builder
WORKDIR /usr/src/app
COPY . .
RUN apt-get -y update
RUN apt-get install musl-tools -y
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=builder /usr/local/cargo/bin/kubernetes-docker-example /usr/local/bin/kubernetes-docker-example
EXPOSE 8080
CMD ["kubernetes-docker-example"]
