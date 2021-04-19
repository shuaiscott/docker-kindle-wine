FROM solarkennedy/wine-x11-novnc-docker:latest

WORKDIR /root

RUN mkdir -p /root/prefix32/drive_c/users/root/AppData/Local/Kindle/

COPY 1.17.44183.exe /root
COPY kindlekey.pyw /root

# X Server Framebuffer to run Wine in
RUN \
apt-get update && \
apt-get install xvfb -y

# Install Kindle
RUN Xvfb :0 -screen 0 1024x768x16 & \
exec wine 1.17.44183.exe "/S"

#RUN wine /root/prefix32/drive_c/Python26/python.exe "/root/kindlekey.pyw"

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
