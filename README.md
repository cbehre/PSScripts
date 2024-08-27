# PSScripts
Repository of PS Scripts created for various purposes.


# [Cleanup Stale Files](/Scripts/CleanUpStaleFiles.ps1)

## Purpose
  - Some applications, typcially vendor supplied have record retention plans and methods to purge data beyond the retention period. In some cases within those applications the database record for a file was purged, yet for one reason or another the acctual file residing on a file share was not deleted. This results in stale or orphaned files that are not ever going to be accessiable since the database record pointing to them no longer exists. 
  - This script was put together to check a directory against a list of known valid file names and delete the "orphaned" or "stale" files to reclaim storage space.

## Method
  - Create or attain a list of valid filenames that are expected to be in a directory/file share
  - Read in the file list
  - Loop over fileshare/directory and check each filename for existence in the known valid file name list. 
    - If file name is not in list, take action such as delete, move, write subsequent list to csv etc.

# [Sync NPS Config](/Scripts/SyncNPSConfig.ps1)

## Purpose
  - Microsoft does not supply a method to have mutliple NPS Servers keep the same configuration
  - Script is meant to keep the configuration in sync on a second NPS Server by using the configuraton from the "main" NPS Server.
  - Team will need to all agree to only make changes to NPS configuration "main" server.

## Method
  - Export NPS Config from "main" server.
  - Import NPS Config into "secondary" server. 