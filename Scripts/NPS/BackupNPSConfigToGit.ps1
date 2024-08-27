# Purpose
#   - Backup NPS Configuration to a git repository
#   - Use a git solution such as gitlab, can set up alerts when changes are detected.
#   - Adjust paths as necessary.

# Move to Git Directory
Set-Location -Path C:\NPS\git\nps-config

# Ensure git user is the user you want to use with git
git config --global user.name "nps.sync.user"
git config --global user.email "nps.sync.user@microsoft.com"
git config core.sshCommand "ssh -i C:\NPS/id_rsa -F /dev/null"

# git pull to get latest
git -c http.sslVerify=false fetch
git -c http.sslVerify=false pull

# Export NPS config
Export-NpsConfiguration -Path C:\NPS\git\nps-config\Configuration\NPSConfig.xml

# Create Commit Message
$currenttime = Get-Date
$mes = "NPS Configuration and Task Backup: " + $currenttime 

git add .
git commit -m $mes
git -c http.sslVerify=false push
