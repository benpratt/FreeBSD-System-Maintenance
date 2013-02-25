#!/bin/csh

# Setup logging
rm /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
cp /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
rm /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Cleanup
date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
echo "rm -rf /var/tmp/temproot"
rm -rf /var/tmp/temproot

# SVN Checkout Method
if -d /usr/src/.svn then
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "cd /usr/src && svn update" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  cd /usr/src && svn update
else
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "svn co svn://svn.freebsd.org/base/head /usr/src" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  svn co svn://svn.freebsd.org/base/head /usr/src
endif