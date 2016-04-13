FROM fedora:23
MAINTAINER “Emory Merryman” <emory.merryman+rCaSpVCacsfEjf3g@gmail.com>
RUN dnf update --assumeyes && dnf install --assumeyes haskell-platform && dnf clean all
RUN useradd developer
USER developer
