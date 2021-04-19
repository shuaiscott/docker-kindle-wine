FROM solarkennedy/wine-x11-novnc-docker:latest

WORKDIR /root

# Add "updates" file to prevent app from auto-updating
RUN \
mkdir -p /prefix32/drive_c/users/root/Local Settings/Application Data/Amazon/Kindle/ &&\
touch /prefix32/drive_c/users/root/Local Settings/Application Data/Amazon/Kindle/updates

COPY 1.17.44183.exe /root
COPY kindlekey.py /root
COPY grabKindleKey.sh /root
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD https://www.python.org/ftp/python/3.8.9/python-3.8.9.exe /root

# X Server Framebuffer to run Wine in
RUN \
apt-get update && \
apt-get install xvfb -y

# Install Kindle
RUN Xvfb :0 -screen 0 1024x768x16 & \
exec wine 1.17.44183.exe "/S" && \
apt-get remove xvfb -y

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
