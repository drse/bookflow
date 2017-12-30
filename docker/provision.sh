#!/bin/sh -eux
# docker-provision.sh --- Provisioning script for a Docker container w/GitBook.
GITBOOK_CLI_VERSION="2.3.2"

# update Apt repositories
apt-get update

# install dependencies
apt-get install -y --no-install-recommends git calibre

# Needed for node-gyp
apt-get install -y pkg-config

# For node-canvas
apt-get install -y libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev build-essential g++

# install GitBook CLI
npm install -g gitbook-cli@$GITBOOK_CLI_VERSION
npm install -g --unsafe-perm --allow-root canvas

# install the latest version...gets installed in $HOME (i.e. /root)
gitbook fetch latest

# add gitbook wrapper script
cat <<EOF > /usr/local/bin/gitbookw
#!/bin/sh -eu
# gitbookw --- Wrapper for gitbook that autoinstalls plugins.
gitbook install
gitbook \$@
EOF
chmod +x /usr/local/bin/gitbookw

# clean up (apt)
apt-get clean       # remove packages that have been downloaded, installed, and no longer needed
apt-get autoclean   # remove archived packages that can no longer be downloaded
apt-get autoremove

# clean up (misc.)
rm -rf /var/lib/apt/lists/* /var/cache/apt/* /root/.npm /tmp/npm*

# Add empty docs directory
mkdir -p /docs
