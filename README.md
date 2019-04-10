# New-ADUserGroup
A colleague of mine reached out to me and asked if I could write a script for him that would make around 150 user accounts that would be used for our internal resident Cisco phone system, so I created this script for him. 

The script imports a CSV file that needs to be filled out based on the variables in the script. Internally, we required first name, last name, display name, username, user principal name, IP phone, notes, and the OU where the account would be placed. Once this information is successfully filled out in the CSV file, the script executes and creates the accounts in a few seconds.

My colleague constantly uses this script whenever he has to provision a large amount of accounts for the phone system, as the devices themselves need to have an AD account tied to them in order to work successfully.
