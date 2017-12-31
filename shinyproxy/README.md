# Shinyproxy

This is an image for [shinyproxy](https://www.shinyproxy.io). Shinyproxy is an alternative to Shiny Server, providing a way to deploy Shiny apps in an enterprise context. Each shiny app should be deployed as a Docker image. Your host machine must have these Docker containers; they will not be pulled automatically.

This uses nginx to route traffic from HTTP to HTTPS, and only to shinyproxy.

## Customising Image

If you just want to get something up and running quickly, you can just use `docker-compose up` after you build the image.

However, you most likely would want to use your own shiny apps with shinyproxy. For this, you will need to modify some files.

### application.yml

You would most likely want to edit the following:

- title (probably not Open Analytics Shiny Proxy)
- logo-url
- authentication (you may want to use Keycloak)
- admin-groups (based on how you configured your user groups)
- ldap settings (point to your own LDAP server)
- apps settings (use your own Shiny apps)

### docker-compose.yml

You would probably want to edit the image name once you build the container.

### Misc

You probably also want to mount application.yml instead of hardcoding it into the image, so that you can modify it as you deploy new Shiny apps. You probably should also mount the SSL certs. For this, you can mount them as volumes. Your docker-compose file would look something like this:

```yaml
version: '2'

services:
  shinyproxy:
    image: jiewpeng/shinyproxy:1.0.0
    network_mode: host
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
    volumes:
      - /path/to/application.yml:/usr/app/shinyproxy/application.yml
      - /path/to/yourdomain.crt:/etc/ssl/yourdomain.crt
      - /path/to/yourdomain.key:/etc/ssl/yourdomain.key
```
