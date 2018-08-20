# Import the CSV file to be read
$Users = Import-Csv "C:\PowerShell\test.csv"

# Loop over the data
foreach ($User in $Users){

    # Store individial information in variables 
    # Information needs to align with the .CSV columns

    $DisplayName = $User.FirstName + " " + $User.LastName
    $FirstName = $User.FirstName
    $LastName = $User.LastName
    $SAM = $User.SamAccountName
    $UPN = $User.UserPrincipalName
    $IPPhone = $User.IPPhone
    $Notes = $User.Notes
    $OU = $User.OU
    
    # Display to user what's happening
    Write-Host 'Creating' $User.SamAccountName
    
    # Create a user account based on the above data structures
    New-ADUser -Name $DisplayName -SamAccountName $SAM -UserPrincipalName $UPN -DisplayName "$DisplayName" -GivenName $FirstName -Surname $LastName -Path $OU -AccountPassword (ConvertTo-SecureString "Free-Masons-2018!" -AsPlainText -Force) -Enabled $true

    # Apply the additional IP Phone information
    Set-ADUser -Identity $SAM -Add @{ipphone=$IPPhone} -Replace @{info=$Notes}
}

# Display output to user when complete
Write-Output "Operation complete. All users imported into Active Directory successfully."