FROM mediawiki:lts

# add ldap suport to php
RUN apt-get update \
&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_39-a9d7d23.tar.gz -o /tmp/LDAPP.tar.gz \
&& tar xf /tmp/LDAPP.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPP.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_39-f73c996.tar.gz -o /tmp/LDAPA.tar.gz \
&& tar xf /tmp/LDAPA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA.tar.gz \  
&& curl -sS https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_39-cbaed5a.tar.gz -o /tmp/PlugA.tar.gz \
&& tar xf /tmp/PlugA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/PlugA.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_39-b4c4283.tar.gz -o /tmp/LDAPA2.tar.gz \
&& tar -xf /tmp/LDAPA2.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA2.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_39-a470354.tar.gz -o /tmp/LDAPU.tar.gz \
&& tar xf /tmp/LDAPU.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPU.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_39-e52460d.tar.gz -o /tmp/Quiz.tar.gz \
&& tar xf /tmp/Quiz.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Quiz.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_39-2923025.tar.gz -o /tmp/TocTree.tar.gz \
&& tar xf /tmp/TocTree.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/TocTree.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_39-34a8c66.tar.gz -o /tmp/Auth_remoteuser.tar.gz \
&& tar xf /tmp/Auth_remoteuser.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Auth_remoteuser.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_39-0efa8c9.tar.gz -o /tmp/DarkMode.tar.gz \
&& tar xf /tmp/DarkMode.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/DarkMode.tar.gz \
&& mkdir -p /etc/var/kerberos
