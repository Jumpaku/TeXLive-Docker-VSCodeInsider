FROM ubuntu:20.04

ENV PATH $PATH:/usr/local/texlive/2019/bin/x86_64-linux

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y \
        perl \
        python-pygments \
        wget \
        xz-utils \
        ghostscript \
        git \
# 
    && wget -nv -O install-tl.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && mkdir install-tl \
    && tar -xzf install-tl.tar.gz --directory install-tl --strip-components=1 \
    && printf "%s\n" \
        "selected_scheme scheme-full" \
        "option_doc 0" \
        "option_src 0" \
        "option_adjustrepo 0" \
        "option_desktop_integration 0" \
        "option_file_assocs 0" \
        "option_menu_integration 0" \
        > /install-tl/texlive.profile \
    && /install-tl/install-tl --profile=/install-tl/texlive.profile \
#
    && cd ../ \
    && rm -rf install-tl.tar.gz install-tl \
    && apt purge -y \
        wget \
        xz-utils \
    && apt autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir/

CMD ["bash"]
