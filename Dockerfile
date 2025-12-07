FROM debian:bookworm-slim

# Thêm certificate root (nếu bạn gọi HTTPS)
RUN apt-get update && apt-get install -y \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy binary đã build vào container
COPY rust_proxy /usr/local/bin/rust_proxy

# Cho phép chạy
RUN chmod +x /usr/local/bin/rust_proxy

# Expose port (nếu cần)
EXPOSE 8080

# Chạy chương trình
CMD ["rust_proxy"]
