FROM mediawiki:lts

# add ldap suport to php
RUN apt-get update \
&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPProvider&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-1300b26.tar.gz -o /tmp/LDAPP.tar.gz \
&& tar xf /tmp/LDAPP.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPP.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPAuthorization&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-3dd25d9.tar.gz -o /tmp/LDAPA.tar.gz \
&& tar xf /tmp/LDAPA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA.tar.gz \  
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=PluggableAuth&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_35-e2589cd.tar.gz -o /tmp/PlugA.tar.gz \
&& tar xf /tmp/PlugA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/PlugA.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPAuthentication2&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-03fba4b.tar.gz -o /tmp/LDAPA2.tar.gz \
&& tar -xf /tmp/LDAPA2.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA2.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPUserInfo&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_35-3ab25cf.tar.gz -o /tmp/LDAPU.tar.gz \
&& tar xf /tmp/LDAPU.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPU.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=Quiz&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_35-589f874.tar.gz -o /tmp/Quiz.tar.gz \
&& tar xf /tmp/Quiz.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Quiz.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=TocTree&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_35-208283c.tar.gz -o /tmp/TocTree.tar.gz \
&& tar xf /tmp/TocTree.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/TocTree.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=Auth_remoteuser&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_35-8092e6e.tar.gz -o /tmp/Auth_remoteuser.tar.gz \
&& tar xf /tmp/Auth_remoteuser.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Auth_remoteuser.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=DarkMode&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_35-42d99d2.tar.gz -o /tmp/DarkMode.tar.gz \
&& tar xf /tmp/DarkMode.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/DarkMode.tar.gz \
&& mkdir -p /etc/var/kerberos
