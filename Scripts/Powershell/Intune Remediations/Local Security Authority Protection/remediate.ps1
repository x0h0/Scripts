# Define the registry path
$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'

# Define the expected registry values
$expectedValues = @{
	'RunAsPPL' = 1
}

# Check if the registry path exists
if (-not (Test-Path $registryPath)) {
	# Create the registry path if it does not exist
	New-Item -Path $registryPath -Force
}

# Process each registry value
foreach ($key in $registryValues.Keys) {
	# Set the DWORD value
	New-ItemProperty -Path $registryPath -Name $key -Value $registryValues[$key] -PropertyType DWord -Force
}