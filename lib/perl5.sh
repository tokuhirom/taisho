install_perl () {
    local version=$1
    local dst=$2

    if [ ! -f /usr/local/bin/perl-build ]; then
        curl https://raw.github.com/tokuhirom/Perl-Build/master/perl-build  > /usr/local/bin/perl-build
    fi
    chmod +x /usr/local/bin/perl-build

    if [ ! -d $dst ]; then
         perl /usr/local/bin/perl-build $version $dst
    fi
    if [ ! -f $dst/bin/cpanm ]; then
        curl -L http://cpanmin.us/ | $dst/bin/perl - App::cpanminus Carton
    fi
}

