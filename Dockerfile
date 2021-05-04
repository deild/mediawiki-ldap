FROM mediawiki:1.35.2

# add ldap suport to php
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& rm -rf /var/lib/apt/lists
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPProvider
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_35-2fa0dbb.tar.gz -o /tmp/LDAPP.tgz && \
    	tar zxf /tmp/LDAPP.tgz -C /var/www/html/extensions && \
    	rm -rf /tmp/LDAPP.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthorization
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_35-e037664.tar.gz -o /tmp/LDAPA.tgz && \
    	tar zxf /tmp/LDAPA.tgz -C /var/www/html/extensions && \
    	rm -rf /tmp/LDAPA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/PluggableAuth
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_35-2a465ae.tar.gz -o /tmp/PlugA.tgz && \
    	tar zxf /tmp/PlugA.tgz -C /var/www/html/extensions && \
    	rm -rf /tmp/PlugA.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPAuthentication2
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_35-58e281c.tar.gz -o /tmp/LDAPA2.tgz && \
    	tar -zxf /tmp/LDAPA2.tgz -C /var/www/html/extensions && \
    	rm -rf /tmp/LDAPA2.tgz
# https://www.mediawiki.org/wiki/Special:ExtensionDistributor/LDAPUserInfo
RUN 	curl -S https://extdist.wmflabs.org/dist/extensions/LDAPUserInfo-REL1_35-2c2d4b3.tar.gz -o /tmp/LDAPU.tgz && \
    	tar zxf /tmp/LDAPU.tgz -C /var/www/html/extensions && \
    	rm -rf /tmp/LDAPU.tgz