FROM gitpod/workspace-full:latest

# Install Kali Linux tools
RUN sudo apt-get update && \
    sudo apt-get install -y kali-linux-default && \
    sudo apt-get clean

# Install noVNC and a lightweight desktop environment
RUN sudo apt-get install -y xfce4 xfce4-goodies tightvncserver x11vnc xvfb novnc websockify && \
    sudo mkdir -p /root/.vnc && \
    sudo x11vnc -storepasswd gitpod /root/.vnc/passwd

# Expose a port for noVNC
EXPOSE 8080

# Copy SSL certificate
COPY cert.pem /etc/ssl/novnc.pem

# Start noVNC server
CMD ["bash", "-c", "vncserver :1 -geometry 1024x768 -depth 24 && websockify -D --web /usr/share/novnc/ --token-auth --ssl-only --cert /etc/ssl/novnc.pem 8080 localhost:5901"]
