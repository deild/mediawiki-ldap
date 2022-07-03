FROM mediawiki:stable

# add ldap suport to php
RUN apt-get update \
&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev libapache2-mod-auth-gssapi \
&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPProvider
&& curl -S https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-1300b26.tar.gz -o /tmp/LDAPP.tgz && \
tar zxf /tmp/LDAPP.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPP.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthorization
&& curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-3dd25d9.tar.gz -o /tmp/LDAPA.tgz && \
tar zxf /tmp/LDAPA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/PluggableAuth
&& curl -S https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_38-6152c6f.tar.gz -o /tmp/PlugA.tgz && \
tar zxf /tmp/PlugA.tgz -C /var/www/html/extensions && \
rm -rf /tmp/PlugA.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthentication2
&& curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-03fba4b.tar.gz -o /tmp/LDAPA2.tgz && \
tar -zxf /tmp/LDAPA2.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPA2.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPUserInfo
&& curl -S https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_38-b95faa0.tar.gz -o /tmp/LDAPU.tgz && \
tar zxf /tmp/LDAPU.tgz -C /var/www/html/extensions && \
rm -rf /tmp/LDAPU.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Quiz
&& curl -S https://extdist.wmflabs.org/dist/extensions/Quiz-REL1_38-6db92eb.tar.gz -o /tmp/Quiz.tgz && \
tar zxf /tmp/Quiz.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Quiz.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/TocTree
&&	curl -S https://extdist.wmflabs.org/dist/extensions/TocTree-REL1_38-a2351fe.tar.gz -o /tmp/TocTree.tgz && \
tar zxf /tmp/TocTree.tgz -C /var/www/html/extensions && \
rm -rf /tmp/TocTree.tgz \
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/Auth_remoteuser
&&	curl -S https://extdist.wmflabs.org/dist/extensions/Auth_remoteuser-REL1_38-7155b49.tar.gz -o /tmp/Auth_remoteuser.tgz && \
tar zxf /tmp/Auth_remoteuser.tgz -C /var/www/html/extensions && \
rm -rf /tmp/Auth_remoteuser.tgz \
# https://www.mediawiki.org/wiki/Extension:DarkMode
&&	curl -S https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_38-402ca14.tar.gz -o /tmp/DarkMode.tgz && \
tar zxf /tmp/DarkMode.tgz -C /var/www/html/extensions && \
rm -rf /tmp/DarkMode.tgz \
&& mkdir -p /etc/var/kerberos
