$tpm = Get-WmiObject -Namespace "Root\CIMv2\Security\MicrosoftTpm" -Class Win32_Tpm
if ($tpm -ne $null -and $tpm.SpecVersion -gt "1.2"){
	"TPM 1.2 or greater is installed."
	exit 0
} else {
	"TPM is either not installed or the version is less than 1.2."
	exit 1
}