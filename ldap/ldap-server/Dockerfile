FROM osixia/openldap

# seed db with ldif
COPY files/shinyproxy.ldif \
    /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
