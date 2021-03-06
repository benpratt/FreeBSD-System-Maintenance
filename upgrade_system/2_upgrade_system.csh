#!/bin/csh

# Remove link for next script
  rm /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 2_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Updating MYKERNEL
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Updating MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

  if (`uname -p` == "i386") then
    cd /usr/src/sys/i386/conf/
  else if (`uname -p` == "amd64") then
    cd /usr/src/sys/amd64/conf/
  else
    exit 0
  endif

  rm MYKERNEL
  cp GENERIC MYKERNEL
  sed -i "" '/  I486_CPU/s/^/#/g' MYKERNEL
  sed -i "" '/  I586_CPU/s/^/#/g' MYKERNEL
  sed -i "" '/  GENERIC/s//     MYKERNEL/g' MYKERNEL

  sed -i "" '/  DEBUG=-g/s/^/#/g' MYKERNEL
  sed -i "" '/  WITH_CTF=1/s/^/#/g' MYKERNEL

  sed -i "" '/  GEOM_RAID/s/^/#/g' MYKERNEL

  # Turn off 20140124
  #sed -i "" '/ KDB     /s/^/#/g' MYKERNEL

  sed -i "" '/  DDB     /s/^/#/g' MYKERNEL
  sed -i "" '/  GDB     /s/^/#/g' MYKERNEL
  sed -i "" '/  DEADLKRES/s/^/#/g' MYKERNEL
  sed -i "" '/  INVARIANTS/s/^/#/g' MYKERNEL
  sed -i "" '/  INVARIANT_SUPPORT/s/^/#/g' MYKERNEL
  sed -i "" '/  WITNESS /s/^/#/g' MYKERNEL
  sed -i "" '/  WITNESS_SKIPSPIN        /s/^/#/g' MYKERNEL
  sed -i "" '/  MALLOC_DEBUG_MAXZONES/s/^/#/g' MYKERNEL

  sed -i "" '/  SMP     /s/^/#/g' MYKERNEL
  sed -i "" '/  apic    /s/^/#/g' MYKERNEL

# Removed
#  sed -i "" '/  eisa/s/^/#/g' MYKERNEL

  sed -i "" '/  fdc/s/^/#/g' MYKERNEL

# Removed
#  sed -i "" '/  ahb     /s/^/#/g' MYKERNEL
  sed -i "" '/  ahc     /s/^/#/g' MYKERNEL
  sed -i "" '/  AHC_REG_PRETTY_PRINT/s/^/#/g' MYKERNEL
  sed -i "" '/  ahd     /s/^/#/g' MYKERNEL
  sed -i "" '/  AHD_REG_PRETTY_PRINT/s/^/#/g' MYKERNEL
  sed -i "" '/  esp     /s/^/#/g' MYKERNEL
  sed -i "" '/  hptiop  /s/^/#/g' MYKERNEL
  sed -i "" '/  isp     /s/^/#/g' MYKERNEL
  sed -i "" '/  ispfw   /s/^/#/g' MYKERNEL
  sed -i "" '/  mpt     /s/^/#/g' MYKERNEL
  sed -i "" '/  mps     /s/^/#/g' MYKERNEL
  sed -i "" '/  mpr     /s/^/#/g' MYKERNEL
  sed -i "" '/  ncr     /s/^/#/g' MYKERNEL
  sed -i "" '/  sym     /s/^/#/g' MYKERNEL
  sed -i "" '/  trm     /s/^/#/g' MYKERNEL

  sed -i "" '/  adv     /s/^/#/g' MYKERNEL
  sed -i "" '/  adw     /s/^/#/g' MYKERNEL
  sed -i "" '/  aha     /s/^/#/g' MYKERNEL
  sed -i "" '/  aic     /s/^/#/g' MYKERNEL
  sed -i "" '/  bt      /s/^/#/g' MYKERNEL
  sed -i "" '/  ncv     /s/^/#/g' MYKERNEL
  sed -i "" '/  nsp     /s/^/#/g' MYKERNEL
  sed -i "" '/  stg     /s/^/#/g' MYKERNEL
  sed -i "" '/  isci    /s/^/#/g' MYKERNEL

  #sed -i "" '/ ch      /s/^/#/g' MYKERNEL
  #sed -i "" '/ sa      /s/^/#/g' MYKERNEL
  #sed -i "" '/ ses     /s/^/#/g' MYKERNEL
  #sed -i "" '/ ctl     /s/^/#/g' MYKERNEL

  sed -i "" '/  amr     /s/^/#/g' MYKERNEL
  sed -i "" '/  arcmsr  /s/^/#/g' MYKERNEL
  sed -i "" '/  asr     /s/^/#/g' MYKERNEL
  sed -i "" '/  ciss    /s/^/#/g' MYKERNEL
  sed -i "" '/  dpt     /s/^/#/g' MYKERNEL
  sed -i "" '/  hptmv   /s/^/#/g' MYKERNEL
  sed -i "" '/  hptnr   /s/^/#/g' MYKERNEL
  sed -i "" '/  hptrr   /s/^/#/g' MYKERNEL
  sed -i "" '/  hpt27xx /s/^/#/g' MYKERNEL
  sed -i "" '/  iir     /s/^/#/g' MYKERNEL
  sed -i "" '/  ips     /s/^/#/g' MYKERNEL
  sed -i "" '/  mly     /s/^/#/g' MYKERNEL
  sed -i "" '/  twa     /s/^/#/g' MYKERNEL
  sed -i "" '/  tws     /s/^/#/g' MYKERNEL

  sed -i "" '/  aac     /s/^/#/g' MYKERNEL
  sed -i "" '/  aacp    /s/^/#/g' MYKERNEL
  sed -i "" '/  aacraid /s/^/#/g' MYKERNEL
  sed -i "" '/  ida     /s/^/#/g' MYKERNEL
  sed -i "" '/  mfi     /s/^/#/g' MYKERNEL
  sed -i "" '/  mlx     /s/^/#/g' MYKERNEL
  sed -i "" '/  mrsas   /s/^/#/g' MYKERNEL
  sed -i "" '/  pst     /s/^/#/g' MYKERNEL
  sed -i "" '/  twe     /s/^/#/g' MYKERNEL

  sed -i "" '/  pmtimer /s/^/#/g' MYKERNEL

  sed -i "" '/  cbb     /s/^/#/g' MYKERNEL
  sed -i "" '/  pccard  /s/^/#/g' MYKERNEL
  sed -i "" '/  cardbus /s/^/#/g' MYKERNEL

  sed -i "" '/  uart    /s/^/#/g' MYKERNEL

  sed -i "" '/  ppc/s/^/#/g' MYKERNEL
  sed -i "" '/  ppbus   /s/^/#/g' MYKERNEL
  sed -i "" '/  lpt     /s/^/#/g' MYKERNEL
  sed -i "" '/  ppi     /s/^/#/g' MYKERNEL
  sed -i "" '/  vpo     /s/^/#/g' MYKERNEL

  sed -i "" '/  puc     /s/^/#/g' MYKERNEL

  sed -i "" '/  bxe     /s/^/#/g' MYKERNEL
  sed -i "" '/  de      /s/^/#/g' MYKERNEL
  sed -i "" '/  igb     /s/^/#/g' MYKERNEL
  sed -i "" '/  ix      /s/^/#/g' MYKERNEL
  sed -i "" '/  ixv     /s/^/#/g' MYKERNEL
  sed -i "" '/  ixl     /s/^/#/g' MYKERNEL
  sed -i "" '/  ixlv    /s/^/#/g' MYKERNEL
  sed -i "" '/  le      /s/^/#/g' MYKERNEL
  sed -i "" '/  ti      /s/^/#/g' MYKERNEL
  sed -i "" '/  txp     /s/^/#/g' MYKERNEL
  sed -i "" '/  vx      /s/^/#/g' MYKERNEL

  sed -i "" '/  ae      /s/^/#/g' MYKERNEL
  sed -i "" '/  age     /s/^/#/g' MYKERNEL
  sed -i "" '/  alc     /s/^/#/g' MYKERNEL
  sed -i "" '/  ale     /s/^/#/g' MYKERNEL
  sed -i "" '/  bce     /s/^/#/g' MYKERNEL
  sed -i "" '/  bfe     /s/^/#/g' MYKERNEL
  sed -i "" '/  cas     /s/^/#/g' MYKERNEL
  sed -i "" '/  et      /s/^/#/g' MYKERNEL
  sed -i "" '/  fxp     /s/^/#/g' MYKERNEL
  sed -i "" '/  gem     /s/^/#/g' MYKERNEL
  sed -i "" '/  hme     /s/^/#/g' MYKERNEL
  sed -i "" '/  jme     /s/^/#/g' MYKERNEL
  sed -i "" '/  lge     /s/^/#/g' MYKERNEL
  sed -i "" '/  msk     /s/^/#/g' MYKERNEL
  sed -i "" '/  nfe     /s/^/#/g' MYKERNEL
  sed -i "" '/  nge     /s/^/#/g' MYKERNEL
  sed -i "" '/  nve     /s/^/#/g' MYKERNEL
  sed -i "" '/  pcn     /s/^/#/g' MYKERNEL
  sed -i "" '/  sf      /s/^/#/g' MYKERNEL
  sed -i "" '/  sge     /s/^/#/g' MYKERNEL
  sed -i "" '/  sis     /s/^/#/g' MYKERNEL
  sed -i "" '/  sk      /s/^/#/g' MYKERNEL
  sed -i "" '/  ste     /s/^/#/g' MYKERNEL
  sed -i "" '/  stge    /s/^/#/g' MYKERNEL
  sed -i "" '/  tl      /s/^/#/g' MYKERNEL
  sed -i "" '/  tx      /s/^/#/g' MYKERNEL
  sed -i "" '/  vge     /s/^/#/g' MYKERNEL
  sed -i "" '/  vr      /s/^/#/g' MYKERNEL
  sed -i "" '/  vte     /s/^/#/g' MYKERNEL
  sed -i "" '/  wb      /s/^/#/g' MYKERNEL

  sed -i "" '/  cs      /s/^/#/g' MYKERNEL
  sed -i "" '/  ed      /s/^/#/g' MYKERNEL
  sed -i "" '/  ex      /s/^/#/g' MYKERNEL
  sed -i "" '/  ep      /s/^/#/g' MYKERNEL
  sed -i "" '/  fe      /s/^/#/g' MYKERNEL
  sed -i "" '/  ie      /s/^/#/g' MYKERNEL
  sed -i "" '/  sn      /s/^/#/g' MYKERNEL
  sed -i "" '/  xe      /s/^/#/g' MYKERNEL

  sed -i "" '/  wlan    /s/^/#/g' MYKERNEL
  sed -i "" '/  IEEE80211_DEBUG/s/^/#/g' MYKERNEL
  sed -i "" '/  IEEE80211_AMPDU_AGE/s/^/#/g' MYKERNEL
  sed -i "" '/  IEEE80211_SUPPORT_MESH/s/^/#/g' MYKERNEL
  sed -i "" '/  wlan_wep/s/^/#/g' MYKERNEL
  sed -i "" '/  wlan_ccmp/s/^/#/g' MYKERNEL
  sed -i "" '/  wlan_tkip/s/^/#/g' MYKERNEL
  sed -i "" '/  wlan_amrr/s/^/#/g' MYKERNEL
  sed -i "" '/  an      /s/^/#/g' MYKERNEL
  sed -i "" '/  ath     /s/^/#/g' MYKERNEL
  sed -i "" '/  ath_pci /s/^/#/g' MYKERNEL
  sed -i "" '/  ath_hal /s/^/#/g' MYKERNEL
  sed -i "" '/  AH_SUPPORT_AR5416/s/^/#/g' MYKERNEL
  sed -i "" '/  AH_AR5416_INTERRUPT_MITIGATION/s/^/#/g' MYKERNEL
  sed -i "" '/  ATH_ENABLE_11N/s/^/#/g' MYKERNEL
  sed -i "" '/  ath_rate_sample/s/^/#/g' MYKERNEL
  sed -i "" '/  bwi     /s/^/#/g' MYKERNEL
  sed -i "" '/  bwn     /s/^/#/g' MYKERNEL
  sed -i "" '/  ipw     /s/^/#/g' MYKERNEL
  sed -i "" '/  iwi     /s/^/#/g' MYKERNEL
  sed -i "" '/  iwn     /s/^/#/g' MYKERNEL
  sed -i "" '/  malo    /s/^/#/g' MYKERNEL
  sed -i "" '/  mwl     /s/^/#/g' MYKERNEL
  sed -i "" '/  ral     /s/^/#/g' MYKERNEL
  sed -i "" '/  wi      /s/^/#/g' MYKERNEL
  sed -i "" '/  wl      /s/^/#/g' MYKERNEL
  sed -i "" '/  wpi     /s/^/#/g' MYKERNEL
  sed -i "" '/  virtio  /s/^/#/g' MYKERNEL
  sed -i "" '/  virtio_pci/s/^/#/g' MYKERNEL
  sed -i "" '/  vtnet   /s/^/#/g' MYKERNEL
  sed -i "" '/  virtio_blk/s/^/#/g' MYKERNEL
  sed -i "" '/  virtio_scsi/s/^/#/g' MYKERNEL
  sed -i "" '/  virtio_balloon/s/^/#/g' MYKERNEL
  sed -i "" '/  hyperv  /s/^/#/g' MYKERNEL
  sed -i "" '/  HYPERV  /s/^/#/g' MYKERNEL
  sed -i "" '/  XENHVM  /s/^/#/g' MYKERNEL
  sed -i "" '/  xenpci  /s/^/#/g' MYKERNEL
  sed -i "" '/  vmx     /s/^/#/g' MYKERNEL

  sed -i "" '/  pmspcv  /s/^/#/g' MYKERNEL

  echo "" >> MYKERNEL

  echo "# IPFW Firewall Support" >> MYKERNEL
  echo "options         IPFIREWALL" >> MYKERNEL
  echo "#options                IPFIREWALL_FORWARD" >> MYKERNEL
  echo "options         IPFIREWALL_VERBOSE" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# IPF Firewall Support" >> MYKERNEL
  echo "#options                IPFILTER" >> MYKERNEL
  echo "#options                IPFILTER_LOG" >> MYKERNEL
  echo "#options                IPFILTER_DEFAULT_BLOCK" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# Bridge Support" >> MYKERNEL
  echo "device          if_bridge" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# NAT Support" >> MYKERNEL
  echo "options         IPDIVERT" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# CD-RW Support" >> MYKERNEL
  echo "#device         atapicam" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# Dummynet Support" >> MYKERNEL
  echo "#options                DUMMYNET" >> MYKERNEL
  echo "#options                HZ=1000" >> MYKERNEL

  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "MYKERNEL updated" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "Kernel Modifications Complete"
    echo "Kernel build is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Build the kernel

  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make buildkernel KERNCONF=MYKERNEL
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildkernel complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "make buildkernel complete"
#    mail -s "buildkernel complete" ben@thegeekzone.com <<< "buildkernel is complete. Kernel install is next."
    echo "Kernel install is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Install the kernel

  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make installkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make installkernel KERNCONF=MYKERNEL
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make installkernel complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "make installkernel complete"
#    mail -s "installkernel complete" ben@thegeekzone.com <<< "buildkernel is complete. Reboot is next."
    echo "Reboot is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Prompt for reboot

    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to Reboot into Single User mode"

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 2_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Create link for next script
  ln -s /root/FreeBSD-System-Maintenance/upgrade_system/3_upgrade_system.csh /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh
