FROM ubuntu:22.04 AS base_image

# Install dependencies
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    bison \
    bzip2 \
    build-essential \
    curl \
    default-libmysqlclient-dev \
    dpkg-dev \
    file \
		g++ \
		gcc \
		git \
		imagemagick \
    libbz2-dev \
		libc6-dev \
    libcurl4-openssl-dev \
    libdb-dev \
    libevent-dev \
    libffi-dev \
		libgdbm-dev \
    libglib2.0-dev \
    libgmp-dev \
    libgmp10 \
    libjpeg-dev \
		libkrb5-dev \
    libmysqlclient-dev \
    liblzma-dev \
    libmagickcore-dev \
		libmagickwand-dev \
		libmaxminddb-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libnss3-dev \
    libpng-dev \
		libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
		libssl-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    llvm \
    make \
    patch \
    pkg-config \
    procps \
    sqlite3 \
    unzip \
    wget \
    xz-utils \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install OpenSSL 3.2
RUN wget https://www.openssl.org/source/openssl-3.2.0.tar.gz \
    && tar -xzvf openssl-3.2.0.tar.gz \
    && cd openssl-3.2.0 \
    && ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl \
    && make \
    && make install \
    && cd .. \
    && rm -rf openssl-3.2.0.tar.gz openssl-3.2.0

# Set OpenSSL path
ENV PATH="/usr/local/openssl/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/openssl/lib64:$LD_LIBRARY_PATH"
ENV PKG_CONFIG_PATH="/usr/local/openssl/lib64/pkgconfig:$PKG_CONFIG_PATH"

# Build Ruby 3.1.4 with OpenSSL 3.2
RUN wget https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.4.tar.gz \
    && tar -xzvf ruby-3.1.4.tar.gz \
    && cd ruby-3.1.4 \
    && ./configure --with-openssl-dir=/usr/local/openssl \
    && make \
    && make install \
    && cd .. \
    && rm -rf ruby-3.1.4.tar.gz ruby-3.1.4

# start container
CMD ["irb"]