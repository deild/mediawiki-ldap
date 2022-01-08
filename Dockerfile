FROM mediawiki:1.35.5

# add ldap suport to php
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPProvider
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-a801161.tar.gz -o /tmp/LDAPP.tgz && \
tar zxf /tmp/LDAPP.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPP.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthorization
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-149b7c0.tar.gz -o /tmp/LDAPA.tgz && \
tar zxf /tmp/LDAPA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/PluggableAuth
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_35-efff551.tar.gz -o /tmp/PlugA.tgz && \
tar zxf /tmp/PlugA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/PlugA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthentication2
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-dabdf22.tar.gz -o /tmp/LDAPA2.tgz && \
tar -zxf /tmp/LDAPA2.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA2.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPUserInfo
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_35-d04327e.tar.gz -o /tmp/LDAPU.tgz && \
tar zxf /tmp/LDAPU.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPU.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Quiz
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_35-c16357c.tar.gz -o /tmp/Quiz.tgz && \
tar zxf /tmp/Quiz.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Quiz.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/TocTree
RUN		curl -S https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_35-b14cb5b.tar.gz -o /tmp/TocTree.tgz && \
tar zxf /tmp/TocTree.tgz -C /var/www/html/extensions && \
rm -rf /tmp/TocTree.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Auth_remoteuser
RUN		curl -S https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_35-e30a654.tar.gz -o /tmp/Auth_remoteuser.tgz && \
tar zxf /tmp/Auth_remoteuser.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Auth_remoteuser.tgz

RUN mkdir -p /etc/var/kerberos
