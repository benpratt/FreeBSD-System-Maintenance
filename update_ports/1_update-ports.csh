#!/bin/csh

# Check if SVN
if -d /usr/ports/.svn then
  echo "cd /usr/ports && svn update"
  cd /usr/ports && svn update
else
  echo "svn co https://svn0.us-west.FreeBSD.org/ports/head /usr/ports"
  svn co https://svn0.us-west.FreeBSD.org/ports/head /usr/ports
endif

if ($? == "0") then
  echo "make fetchindex"
  cd /usr/ports/
  make fetchindex
else
  echo "cvsup failed"
  exit 0
endif

if ($? == "0") then
  echo "pkgdb -F"
  /usr/local/sbin/pkgdb -F
else
  echo "make fetchindex failed"
  exit 0
endif

if ($? == "0") then
  echo "Ports Source Update Complete"
else
  echo "pkgdb -F failed"
  exit 0
endif