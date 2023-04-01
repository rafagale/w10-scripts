# Set the username
$username = "USERNAME"

# Set the registry key path for AutoLogon
$regkey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Check if the DefaultPassword value already exists
$existingPassword = Get-ItemProperty -Path $regkey -Name DefaultPassword -ErrorAction SilentlyContinue

# If the DefaultPassword value does not exist, ask for the password and set it
if ($existingPassword -eq $null) {
    $password = Read-Host "Enter the default password for $username" -AsSecureString
    $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    Set-ItemProperty -Path $regkey -Name DefaultPassword -Value $password -Type STRING
}

# Set the AutoLogon value to 1
Set-ItemProperty -Path $regkey -Name AutoAdminLogon -Value 1 -Type DWORD

# Set the DefaultUserName value to the specified username
Set-ItemProperty -Path $regkey -Name DefaultUserName -Value $username -Type STRING
