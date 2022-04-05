FROM mediawiki:1.37.2

# add ldap suport to php
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPProvider
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-c8e3cde.tar.gz -o /tmp/LDAPP.tgz && \
tar zxf /tmp/LDAPP.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPP.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthorization
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-a607301.tar.gz -o /tmp/LDAPA.tgz && \
tar zxf /tmp/LDAPA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/PluggableAuth
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_37-5757eca.tar.gz -o /tmp/PlugA.tgz && \
tar zxf /tmp/PlugA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/PlugA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthentication2
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-18ea92f.tar.gz -o /tmp/LDAPA2.tgz && \
tar -zxf /tmp/LDAPA2.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA2.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPUserInfo
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_37-a4b1bcf.tar.gz -o /tmp/LDAPU.tgz && \
tar zxf /tmp/LDAPU.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPU.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Quiz
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_37-34d3dbc.tar.gz -o /tmp/Quiz.tgz && \
tar zxf /tmp/Quiz.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Quiz.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/TocTree
RUN		curl -S https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_37-d6cd965.tar.gz -o /tmp/TocTree.tgz && \
tar zxf /tmp/TocTree.tgz -C /var/www/html/extensions && \
rm -rf /tmp/TocTree.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Auth_remoteuser
RUN		curl -S https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_37-267291a.tar.gz -o /tmp/Auth_remoteuser.tgz && \
tar zxf /tmp/Auth_remoteuser.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Auth_remoteuser.tgz
# https://www.mediawiki.org/wiki/Extension:DarkMode
RUN		curl -S https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_37-ca482df.tar.gz -o /tmp/DarkMode.tgz && \
tar zxf /tmp/DarkMode.tgz -C /var/www/html/extensions && \
rm -rf /tmp/DarkMode.tgz

RUN mkdir -p /etc/var/kerberos
