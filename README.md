# Ruby

Ruby with OpenSSL 3.2

## Tags

Tags are named after Ruby version.

Images can be found at:

* [Docker hub](https://hub.docker.com/r/dockerteamtruelink/ruby-openssl): `dockerteamtruelink/ruby-openssl`
* Current image built with `docker buildx build --platform linux/amd64  -t dockerteamtruelink/ruby-openssl:3.1.4 --push .`

## Dockerfile

Dockerfile can be found at [GitHub](https://github.com/TrueLinkFinancial/docker-ruby-openssl)

## Steps to verify

1. `docker run -it dockerteamtruelink/ruby-openssl:3.1.4`
2. `RUBY_VERSION` (to verify Ruby version)
3. `require 'openssl'`
4. `puts OpenSSL::OPENSSL_VERSION` (to verify OpenSSL version)
