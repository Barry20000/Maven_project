#!/bin/bash

echo "build ..."
if [ "local_lmao_sdkg" = $1 ] ; then
  mvn clean install -pl lmao-sdkg-client,lmao-sdkg-provider,lmao-sdkg-generator -am
elif [ "publish_lmao_sdkg" = $1 ] ; then
  mvn clean deploy -Prelease -pl lmao-sdkg-client,lmao-sdkg-provider,lmao-sdkg-generator -am
elif [ "package_lmao" = $1 ] ; then
  mvn compile -pl lmao-codeg/lmao-api -am -Dapigc.skip=false
  mvn compile -pl lmao-codeg/lmao-bundle -am -Dbdgc.skip=false
  mvn compile -pl lmao-codeg/lmao-bundle-mock -am -Dbdmgc.skip=false
  mvn compile -pl lmao-codeg/lmao-client -am -Dclientgc.skip=false
  mvn package -pl lmao-codeg/lmao-api,lmao-codeg/lmao-bundle,lmao-codeg/lmao-bundle-mock,lmao-codeg/lmao-client -am
elif [ "local_lmao" = $1 ] ; then
  mvn compile -pl lmao-codeg/lmao-api -am -Dapigc.skip=false
  mvn compile -pl lmao-codeg/lmao-bundle -am -Dbdgc.skip=false
  mvn compile -pl lmao-codeg/lmao-client -am -Dclientgc.skip=false
  mvn install -pl lmao-codeg/lmao-api,lmao-codeg/lmao-bundle,lmao-codeg/lmao-client -am
elif [ "deploy_lmao" = $1 ] ; then
  mvn compile -pl lmao-codeg/lmao-api -am -Dapigc.skip=false
  mvn compile -pl lmao-codeg/lmao-bundle -am -Dbdgc.skip=false
  mvn compile -pl lmao-codeg/lmao-client -am -Dclientgc.skip=false
  mvn deploy  -Prelease -pl lmao-codeg/lmao-api,lmao-codeg/lmao-bundle,lmao-codeg/lmao-client -am
elif [ "package_lmao_mock_server" = $1 ] ; then
  mvn package -pl lmao-codeg/lmao-mock-server -am -Dbdmgc.skip=false
elif [ "clean" = $1 ] ; then
  mvn clean
  rm -rf lmao-codeg/lmao-api/src
  rm -rf lmao-codeg/lmao-bundle/src
  rm -rf lmao-codeg/lmao-bundle-mock/src
  rm -rf lmao-codeg/lmao-client/src
elif [ "set_version" = $1 ] ; then
  mvn versions:set -DnewVersion=$2
  cd lmao-codeg
  mvn versions:set -DnewVersion=$2
  cd ..
fi
echo "build done."
