# Define the registry path
$registryPath = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown'

# Define the expected registry values
$expectedValues = @{
	'bDisableJavaScript' = 1
	'bEnableFlash' = 0
	'bUpdater' = 0
	'bAcroSupressUpsell' = 0
	'bUsageMeasurement' = 0
}

# Initialize a flag for compliance
$compliant = $true

# Check each expected value
foreach ($key in $expectedValues.Keys) {
	$currentValue = Get-ItemProperty -Path $registryPath -Name $key -ErrorAction SilentlyContinue
	if (-not $currentValue -or $currentValue.$key -ne $expectedValues[$key]) {
		$compliant = $false
		break
	}
}

# Set the exit code based on compliance
if ($compliant) {
	exit 0  # Compliant
} else {
	exit 1  # Non-compliant
}