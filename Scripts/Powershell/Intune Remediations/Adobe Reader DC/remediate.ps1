# Define the registry path
$registryPath = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown'

# Define the registry values to set
$registryValues = @{
	'bDisableJavaScript' = 1
	'bUpdater' = 0
	'bAcroSupressUpsell' = 0
	'bUsageMeasurement' = 0
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