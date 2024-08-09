$freeSpace = (Get-PSDrive C).Free / 1GB
if ($freeSpace -gt 10){
	"Sufficient free space."
	exit 0
} else {
	"Not enough free space."
	exit 1
}