#!/bin/bash

# .Brewfile hash: {{ include "dot_Brewfile.tmpl" | sha256sum }}
# Including the hash forces this script to run whenever .Brewfile is updated
brew bundle --file="~/.Brewfile"
