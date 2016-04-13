FROM fedora:23
MAINTAINER “Emory Merryman” <emory.merryman+rCaSpVCacsfEjf3g@gmail.com>
RUN dnf update --assumeyes && dnf install --assumeyes git haskell-platform && dnf clean all
RUN useradd developer
COPY config /home/developer/.ssh/config
COPY private/strawsound_id_rsa /home/developer/.ssh/strawsound_id_rsa
RUN chmod 0700 /home/developer/.ssh
RUN chmod 0600 /home/developer/.ssh/config
RUN chmod 0600 /home/developer/.ssh/strawsound_id_rsa
RUN chown --recursive developer:developer /home/developer/.ssh
USER developer
RUN mkdir --parents /home/developer/working/desertedscorpion && git -C /home/developer/working/desertedscorpion clone git@github.com:desertedscorpion/navyclown.git
RUN git config --global user.email "emory.merryman+QgGkUCPqRfjuydzJ@gmail.com" && git config --global user.name "Emory Merryman"