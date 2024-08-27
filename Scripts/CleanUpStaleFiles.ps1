
# Purpose
#   - Read in a CSV File containing valid filenames (ex. header row column name of file_name)
#   - Loop over all files in directory
#      - Check if filename exists in list of valid filenames, if not take action such as delete, or simply list

# Load list of valid filenames

$ValidFileListCSV = "PATH_TO_CSV_FILE_CONTAINING_VALID_FILENAMES"

# Load the CSV file
$csv = Import-Csv -Path $ValidFileListCSV

# Extract the list of values from the 'image_id' column
$validFiles_list = $csv | Select-Object -ExpandProperty file_name

# Set root folder/path
$directory = "PATH_TO_DIRECTORY_CONTAINING_FILES_TO_CHECK"


# Initialize a counter -- to use to break out of loop for testing purposes, comment out if statement inside loop when not needed.
$counter = 0

# Loop through each file in the directory and its subdirectories
Get-ChildItem -Path $directory -Recurse -File | ForEach-Object {
    $file = $_
    
    # Increment the counter
    $counter++

    # Extract the filename (without extension)
    $filename = $file.BaseName
    
    if ($validFiles_list -contains $filename) {
        Write-Output "The name '$filename' exists in the list."        
    } else {
        Write-Output "The name '$filename' does not exist in the list."

       # After testing, can put code here to delete file for example.     
        
    }
    
    # For testing purposes, break the loop after 10 iterations -- comment section out after testing to loop through all files in directory.
    if ($counter -ge 10) {
        Write-Output "Reached 10 files, exiting loop."
        break
    }
    
}
