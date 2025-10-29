FROM ghcr.io/cirruslabs/flutter:3.24.0

WORKDIR /app

COPY pubspec.yaml ./
RUN flutter pub get

COPY . .

RUN flutter pub get

CMD ["bash"]
