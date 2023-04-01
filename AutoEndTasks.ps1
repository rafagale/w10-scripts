# Set the registry key path for AutoEndTasks
$regkey = "HKCU:\Control Panel\Desktop"

# Check if the AutoEndTasks value already exists
$existingValue = Get-ItemProperty -Path $regkey -Name AutoEndTasks -ErrorAction SilentlyContinue

# If the AutoEndTasks value does not exist, set it to 1
if ($existingValue -eq $null) {
    Set-ItemProperty -Path $regkey -Name AutoEndTasks -Value 1 -Type DWORD
}
