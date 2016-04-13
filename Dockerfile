FROM fedora:23
MAINTAINER “Emory Merryman” <emory.merryman+rCaSpVCacsfEjf3g@gmail.com>
RUN dnf update --assumeyes && dnf install --assumeyes git haskell-platform && dnf clean all
RUN useradd developer
USER developer
COPY config /home/developer/.ssh/config
COPY private/strawsound_id_rsa /home/developer/.ssh/strawsound_id_rsa
RUN chmod 0700 /home/developer/.ssh && chmod 0600 /home/developer/.ssh/config && chmod 0600 /home/developer/.ssh/strawsound_id_rsa && mkdir --parents /home/developer/working/desertedscorpion && git -C /home/developer/working/desertedscorpion clone https://github.com/desertedscorpion/navyclown.git && git config --global user.email "emory.merryman+QgGkUCPqRfjuydzJ@gmail.com" && git config --global user.name "Emory Merryman"