[![Docker](https://img.shields.io/docker/cloud/build/eaudeweb/scratch?label=Docker&style=flat&logo=docker)](https://hub.docker.com/repository/docker/deild/mediawiki-ldap/builds)

# Mediawiki with LDAP authentication extensions

Based on the lts [official Mediawiki container](https://hub.docker.com/_/mediawiki).

## Extensions

- [LDAPProvider](https://www.mediawiki.org/wiki/Extension:LDAPProvider)
- [LDAPAuthorization](https://www.mediawiki.org/wiki/Extension:LDAPAuthorization)
- [PluggableAuth](https://www.mediawiki.org/wiki/Extension:PluggableAuth)
- [LDAPAuthentication2](https://www.mediawiki.org/wiki/Extension:LDAPAuthentication2)
- [LDAPUserInfo](https://www.mediawiki.org/wiki/Extension:LDAPUserInfo)
- [Quiz](https://www.mediawiki.org/wiki/Extension:Quiz)
- [TocTree](https://www.mediawiki.org/wiki/Extension:TocTree)
- [Auth remoteuser](https://www.mediawiki.org/wiki/Extension:Auth_remoteuser)
- [DarkMode](https://www.mediawiki.org/wiki/Extension:DarkMode)

## Installation

```sh
docker pull deild/mediawiki-ldap:latest
```
