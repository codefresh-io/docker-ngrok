FROM alpine:3.8

ADD https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz /ngrok.tgz

RUN set -x \
  # Install ngrok (latest official stable from https://ngrok.com/download).
  && tar -xzf /ngrok.tgz -C /bin \
  && rm -f /ngrok.tgz \
  # Create non-root user.
  && adduser -h /home/ngrok -D -u 6737 ngrok

# Add config script.
COPY entrypoint.sh /

USER ngrok
ENV USER=ngrok

EXPOSE 4040

CMD ["/entrypoint.sh"]
