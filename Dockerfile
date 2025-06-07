FROM busybox:stable

USER 1000:1000

COPY script.sh /

CMD ["/script.sh"]
