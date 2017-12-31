FROM osixia/openldap:1.1.9

# seed db with ldif
COPY files/shinyproxy.ldif \
    /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
