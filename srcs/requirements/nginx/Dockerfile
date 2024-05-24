FROM alpine:3.19

#--no-cache delete temporary files.
RUN	apk update && \
	apk upgrade && \
	apk add --no-cache nginx openssl

#/run/nginx will stock PID files and /etc/nginx/conf.d will stock .conf supp files.
RUN	mkdir -p /run/nginx && \
	mkdir -p /etc/nginx/conf.d && \
	mkdir -p /etc/nginx/certs

#Create a certificate auto-signed for TLS 1.3 (for test)
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/certs/server.key \
	-out /etc/nginx/certs/server.crt \
	-subj "/C=FR/ST=Denial/L=Mulhouse/0=Dis/CN=joakoeni.42.fr"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

COPY	conf/default.conf /etc/nginx/conf.d/default.conf

#Expose port 443 for TLS/HTTPS connexion
EXPOSE 443

#Start NGINX and stay in first plan
CMD ["nginx", "-g", "daemon off;"]

