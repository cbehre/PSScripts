# Purpose
#   - To Sync a Microsoft NPS Server's Configuration between two NPS Servers. 
#   - Since Microsoft does not give a method to keep the configuration between NPS Servers in cync, this script will export the configuration from the chosen "main" NPS server
#     then copy and import the configuration into the secondary NPS Server(s).
#   - Paths can be adjusted where files are stored.
#   - Optionally, keep a local back up of the NPS configuration.
#   - Future enhancements
#     - Clear backups based on retention number of days.
#     - Check for changes before sync agianst last backed up config, if no changes dont import to secondary server

﻿# Get date
$date = get-date -Format yyyy_MM_dd

# Destination Server
$NPSDestServer = "SECONDARY_NPS_SERVER_HOSTNAME"

# Export NPS config
Export-NpsConfiguration -Path C:\NPS\Configuration\NPSConfig_$date.xml
Export-NpsConfiguration -Path C:\NPS\Configuration\NPSConfig.xml

# Copy config to destination server
Copy-Item -path C:\NPS\Configuration\NPSConfig.xml -destination "\\$NPSDestServer\NPS\Configuration\NPSConfig.xml"

# Export current config
Invoke-Command -ComputerName $NPSDestServer -ScriptBlock {$date = get-date -Format yyyy_MM_dd
Export-NPSConfiguration -Path C:\NPS\Backup\NPSConfig_local_$date.xml}

# Import new config
Invoke-Command -ComputerName $NPSDestServer -ScriptBlock {Import-NPSConfiguration -Path C:\NPS\Configuration\NPSConfig.xml}


Exit