FROM mediawiki:1.35.6

# add ldap suport to php
RUN apt-get update \
&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPProvider&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-6fc1fd2.tar.gz -o /tmp/LDAPP.tar.gz \
&& tar xf /tmp/LDAPP.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPP.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPAuthorization&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-d35ce94.tar.gz -o /tmp/LDAPA.tar.gz \
&& tar xf /tmp/LDAPA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA.tar.gz \  
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=PluggableAuth&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_35-9bfad40.tar.gz -o /tmp/PlugA.tar.gz \
&& tar xf /tmp/PlugA.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/PlugA.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPAuthentication2&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-0e5a0e6.tar.gz -o /tmp/LDAPA2.tar.gz \
&& tar -xf /tmp/LDAPA2.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPA2.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=LDAPUserInfo&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_35-e41617f.tar.gz -o /tmp/LDAPU.tar.gz \
&& tar xf /tmp/LDAPU.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/LDAPU.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=Quiz&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_35-00d1f1c.tar.gz -o /tmp/Quiz.tar.gz \
&& tar xf /tmp/Quiz.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Quiz.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=TocTree&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_35-6b1a192.tar.gz -o /tmp/TocTree.tar.gz \
&& tar xf /tmp/TocTree.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/TocTree.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=Auth_remoteuser&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_35-c413cc4.tar.gz -o /tmp/Auth_remoteuser.tar.gz \
&& tar xf /tmp/Auth_remoteuser.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/Auth_remoteuser.tar.gz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=DarkMode&extdistversion=REL1_35
&& curl -sS https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_35-ee0723f.tar.gz -o /tmp/DarkMode.tar.gz \
&& tar xf /tmp/DarkMode.tar.gz -C /var/www/html/extensions \
&& rm -rf /tmp/DarkMode.tar.gz \
&& mkdir -p /etc/var/kerberos
