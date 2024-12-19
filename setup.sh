#!/bin/bash

# Download the logstash tar.gz file
wget https://prod1-us.blusapphire.net/export/install/logstash-8.9.0.tar.gz -P /opt/snb-tech/Logdetector/
wget https://github.com/farooq-001/packages-elk/raw/master/nexus.tar.gz -P /opt/snb-tech/Logdetector/

# Assuming nexus.tar.gz is already present in the directory
# Unzip the tar files
tar -zxvf /opt/snb-tech/Logdetector/nexus.tar.gz -C /opt/snb-tech/Logdetector/
tar -zxvf /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz -C /opt/snb-tech/Logdetector/

# Create symbolic links for nexus and logstash
ln -s /opt/snb-tech/Logdetector/nexus /opt/nexus
ln -s /opt/snb-tech/Logdetector/logstash-8.9.0 /opt/collector

# creat sample service file
cp -r /opt/nexus/snb_windows.service  /etc/systemd/system

# Create the .install directory and move the tar.gz files there
mkdir -p /opt/snb-tech/Logdetector/.install
mv /opt/snb-tech/Logdetector/nexus.tar.gz   /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz /opt/snb-tech/Logdetector/.install


# End of script
echo "##### DONE #####"
