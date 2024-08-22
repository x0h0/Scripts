# Define the registry path
$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'

# Define the expected registry values
$expectedValues = @{
	'RunAsPPL' = 1
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