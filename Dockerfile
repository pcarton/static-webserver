FROM rust:buster as build

WORKDIR /app

COPY src/* /app/src/
COPY Cargo.** /app/

RUN rustup default nightly
RUN cargo build -r 

FROM gcr.io/distroless/cc

COPY --from=build /app/target/release/static-webserver /
COPY static /app/static

ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000

ENTRYPOINT ["/static-webserver"]
