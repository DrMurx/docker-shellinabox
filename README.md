# Shell In A Box Docker Image

Simple and plain: 

* It exposes the ShellInABox daemon on port 4200, as HTTPS with a self-signed SSL certificate.
* It provides a login shell to a user inside the container.
* The user is named `user` and the password can be passed via the environment variable `$PASSWORD`.
* An openssh client is available in the container to access the host system.

If you need more commands, just use this image as base and `apt install` whatever you need.

If you need a signed HTTPS certificate, put an instance of [nginx-proxy](https://github.com/jwilder/nginx-proxy)
with its Let's Encrypt companion in front.
