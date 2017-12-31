# Shinyproxy "package"

This collection of Docker images provides a "complete" environment with an LDAP server with user administration system (phpLDAPadmin) plus shinyproxy, **for testing purposes**. It can be adapted for production with some changes to the configuration of LDAP and Shinyproxy.

**Currently with this setup, LDAP and phpLDAPadmin run on HTTP; only Shinyproxy runs on HTTPS.**

## Getting Started

### All services in one server

Just run `docker-compose up` in this folder. Shinyproxy will listen on localhost ports 80 (HTTP, will be routed to HTTPS) and 443 (HTTPS). LDAP server will run on port 389, and phpLDAPadmin will run on port 6080. See below sections on the default setup for each service (LDAP and Shinyproxy).

### LDAP

To set up the LDAP server, go into the `ldap` folder and run `docker-compose up`.

This LDAP server is seeded with an admin user (cn=admin,dc=example,dc=org) (password: 'admin'), a read-only user for Shinyproxy to use (cn=readonly,dc=example,dc=org) (password: 'readonly'), 2 users `tesla` and `gauss` (password: 'password'). `tesla` belongs to the `scientists` group, and `gauss` belongs to the `mathematicians` group.

### Shinyproxy

To set up shinyproxy, go into the `shinyproxy` folder and run `docker-compose up`.

The server will listen on ports 80 and 443. nginx will route the traffic to port 8080, which is used by shinyproxy. It also connects to the LDAP database running on localhost (since this setup runs all 3 services on the same server).

### Simpleapp

This is just a simple Shiny app that I made, which shows the `session$clientData` of the Shiny session, as well as the username and user groups of the logged in user. This app will be served by Shinyproxy.

This image is based on the `jiewpeng/mro` image.
