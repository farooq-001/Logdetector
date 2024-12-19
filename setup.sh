#!/bin/bash

# Download the logstash tar.gz file
wget https://prod1-us.blusapphire.net/export/install/logstash-8.9.0.tar.gz -P /opt/snb-tech/Logdetector/

# Unzip the tar files
unzip /opt/snb-tech/Logdetector/nexus.tar.gz -d /opt/snb-tech/Logdetector/
unzip /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz -d /opt/snb-tech/Logdetector/

# Copy the snb_windows.service file to the systemd directory
cp -r snb_windows.service /etc/systemd/system/

# Create symbolic links for nexus and logstash
ln -s /opt/snb-tech/Logdetector/nexus /opt/nexus
ln -s /opt/snb-tech/Logdetector/logstash-8.9.0 /opt/collector

# Create the .install directory and move the tar.gz files there
mkdir -p /opt/snb-tech/Logdetector/.install
mv /opt/snb-tech/Logdetector/nexus.tar.gz /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz /opt/snb-tech/Logdetector/.install

#End of script

echo  #####  DONE  ######
