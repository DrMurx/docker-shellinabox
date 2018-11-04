#! /bin/sh

echo "user:${PASSWORD}" | /usr/sbin/chpasswd
unset PASSWORD

exec /usr/bin/shellinaboxd \
  -u shellinabox \
  -g shellinabox \
  -c /var/lib/shellinabox \
  -p 4200 \
  -s /:AUTH:HOME:/bin/bash \
  --no-beep \
  --disable-ssl-menu \
  --user-css "$(
    for i in $(ls /etc/shellinabox/options-enabled/*.css | sed -e 's/.*[/]\([0-9]*\)[-_+][^/:,;]*[.]css/\1/' | sort -u); do
      for j in /etc/shellinabox/options-enabled/"$i"*.css; do
        echo -n "$j" |
        sed -e 's/\(.*[/]\)\([0-9]*\)\([-_+]\)\([^/:,;]*\)[.]css/\4:\3\1\2\3\4.css,/' -e 's/:_/:-/'
      done | sed -e 's/,$/;/'
    done | sed -e 's/;$//' -e '//b'
  )"
