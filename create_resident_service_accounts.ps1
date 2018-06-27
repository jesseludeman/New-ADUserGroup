# Import the CSV file to be read
$Users = Import-Csv 'C:\PowerShell\create_resident_service_accounts\file.csv'

# Define the OU for users to be placed in via the Distinguished Name
$OU = 'OU=BacchusMarsh,OU=ResidentVoicemailAccounts,DC=rfhv,DC=freemasons,DC=net,DC=au'

# Loop over the data
foreach ($User in $Users){

    # Store individial information in variables
    $FirstName = $User.FirstName
    $LastName = $User.LastName
    $SAM = $User.SamAccountName
    $UPN = $User.userPrincipalName
    $IPPhone = $User.IPPhone
    $Notes = $User.Notes
    $Password = $User.Password
    $DisplayName = $User.FirstName + " " + $User.LastName
    
    # Display to user what's happening
    Write-Host 'Analysing' $User.SamAccountName
    
    # Create a user account based on the above data structures
    New-ADUser -Name $DisplayName -SamAccountName $SAM -UserPrincipalName $UPN -DisplayName "$DisplayName" -GivenName $FirstName -Surname $LastName -Path $OU -AccountPassword (ConvertTo-SecureString "qwertyuiop" -AsPlainText -Force) -Enabled $true

    # Apply the additional IP Phone information
    Set-ADUser -Identity $SAM -Add @{ipphone=$IPPhone} -Replace @{info=$Notes}
}

# Display output to user when complete
Write-Output 'Operation complete. All users imported into Active Directory successfully.'