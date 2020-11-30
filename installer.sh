#!/bin/bash
DOWNLOAD_DIR=/tmp
EXTENSIONS_DIR=/config/extensions

while IFS=, read -r publisher extension version;
do
EXTENSION_URL="https://$publisher.gallery.vsassets.io/_apis/public/gallery/publisher/$publisher/extension/$extension/$version/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
INSTALLED_VERSION=$(code-server --extensions-dir /config/extensions --list-extensions --show-versions|grep -i $publisher.$extension@|sed 's/.*\@//')
  if [ "$INSTALLED_VERSION" == $version ]; then
    echo "[ $publisher.$extension@$INSTALLED_VERSION.vsix is already installed ]"
  else
    echo "[ Downloading $publisher.$extension@$version.vsix ]"
    curl -s -o $DOWNLOAD_DIR/$publisher.$extension@$version.vsix $EXTENSION_URL
    echo "[ Installing $publisher.$extension@$version ]"
    code-server --extensions-dir $EXTENSIONS_DIR --install-extension $DOWNLOAD_DIR/$publisher.$extension@$version.vsix
    rm $DOWNLOAD_DIR/$publisher.$extension@$version.vsix
  fi
done < <(grep "" ./extensions.csv)