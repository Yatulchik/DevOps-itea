FROM nginx:stable

COPY index.html /usr/share/nginx/html

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["bash","entrypoint.sh"]
