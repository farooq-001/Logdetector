#!/bin/bash

# Download the logstash tar.gz file
wget https://prod1-us.blusapphire.net/export/install/logstash-8.9.0.tar.gz -P /opt/snb-tech/Logdetector/
git clone git clone https://github.com/farooq-001/packages-elk/blob/master/nexus.tar.gz  -P /opt/snb-tech/Logdetector/
# Assuming nexus.tar.gz is already present in the directory
# Unzip the tar files
tar -zxvf /opt/snb-tech/Logdetector/packages-elk/nexus.tar.gz -C /opt/snb-tech/Logdetector/
tar -zxvf /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz -C /opt/snb-tech/Logdetector/


# Copy the snb_windows.service file to the systemd directory
# Make sure snb_windows.service is present in the current directory
cp -r snb_windows.service /etc/systemd/system/

# Create symbolic links for nexus and logstash
ln -s /opt/snb-tech/Logdetector/nexus /opt/nexus
ln -s /opt/snb-tech/Logdetector/logstash-8.9.0 /opt/collector

# Create the .install directory and move the tar.gz files there
mkdir -p /opt/snb-tech/Logdetector/.install
mv /opt/snb-tech/Logdetector/packages-elk/nexus.tar.gz   /opt/snb-tech/Logdetector/logstash-8.9.0.tar.gz /opt/snb-tech/Logdetector/.install
rm -rf /opt/snb-tech/Logdetector/packages-elk

# End of script
echo "##### DONE #####"
