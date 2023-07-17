FROM mediawiki:lts

# add ldap suport to php
RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_39-12bd838.tar.gz -o /tmp/LDAPP.tar.gz \
&& tar xf /tmp/LDAPP.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPP.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_39-7caf22c.tar.gz -o /tmp/LDAPA.tar.gz \
&& tar xf /tmp/LDAPA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA.tar.gz \  
&& curl -sS https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_39-8a48b65.tar.gz -o /tmp/PlugA.tar.gz \
&& tar xf /tmp/PlugA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/PlugA.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_39-649e1ce.tar.gz -o /tmp/LDAPA2.tar.gz \
&& tar -xf /tmp/LDAPA2.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA2.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_39-01a4b9e.tar.gz -o /tmp/LDAPU.tar.gz \
&& tar xf /tmp/LDAPU.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPU.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_39-41387e3.tar.gz -o /tmp/Quiz.tar.gz \
&& tar xf /tmp/Quiz.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Quiz.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_39-ca48e16.tar.gz -o /tmp/TocTree.tar.gz \
&& tar xf /tmp/TocTree.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/TocTree.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_39-873d1df.tar.gz -o /tmp/Auth_remoteuser.tar.gz \
&& tar xf /tmp/Auth_remoteuser.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Auth_remoteuser.tar.gz \
&& curl -sS https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_39-9387378.tar.gz -o /tmp/DarkMode.tar.gz \
&& tar xf /tmp/DarkMode.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/DarkMode.tar.gz \
&& mkdir -p /etc/var/kerberos
