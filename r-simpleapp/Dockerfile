FROM jiewpeng/mro:3.4.2

# copy app to the image
RUN mkdir /root/simpleapp
COPY files /root/simpleapp

RUN echo "local({options(shiny.port = 3838, shiny.host = '0.0.0.0')})" >> /usr/lib/R/etc/Rprofile.site

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/simpleapp')"]
