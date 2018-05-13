$path = $args[0]
$type = ""
$content = ((Get-Content $path -Encoding Byte | select -First 10000 | Out-String).Split([Environment]::Newline) | ? {$_})
for($i = 0; $i-le $content.length-1; $i++){
 if ($content[$i] -eq 80 -And $content[$i + 1] -eq 69 -And $content[$i + 2] -eq 0 -And $content[$i + 3] -eq 0){
  $type = [Convert]::ToString("{0:x}" -f [int]$content[$i + 5]) + [Convert]::ToString("{0:x}" -f [int]$content[$i + 4])
 }
}
$string = "This file is compatible with"
$archi = "architecture."
switch ( $type )
{
	0000	{ The contents of this field are assumed to be applicable to any machine type }
	1d3	{ Write-Host $string "Matsushita AM33" $archi}
	8664	{ Write-Host $string "x64" $archi }
	1c0	{ Write-Host $string "ARM little endian" $archi }
	aa64	{ Write-Host $string "ARM64 little endian" $archi }
	1c4	{ Write-Host $string "ARM Thumb-2 little endian" $archi }
	ebc	{ Write-Host $string "EFI byte code" $archi }
	14c	{ Write-Host $string "Intel 386 (x86)" $archi }
	200	{ Write-Host $string "Intel Itanium processor family" $archi }
	9041	{ Write-Host $string "Mitsubishi M32R little endian" $archi }
	266	{ Write-Host $string "MIPS16" $archi }
	366	{ Write-Host $string "MIPS with FPU" $archi }
	466	{ Write-Host $string "MIPS16 with FPU" $archi }
	1f0	{ Write-Host $string "Power PC little endian" $archi }
	1f1	{ Write-Host $string "Power PC with floating point support" $archi }
	166	{ Write-Host $string "MIPS little endian" $archi }
	5032	{ Write-Host $string "RISC-V 32-bit address space" $archi }
	5064	{ Write-Host $string "RISC-V 64-bit address space" $archi }
	5128	{ Write-Host $string "RISC-V 128-bit address space" $archi }
	1a2	{ Write-Host $string "Hitachi SH3" $archi }
	1a3	{ Write-Host $string "Hitachi SH3 DSP" $archi }
	1a6	{ Write-Host $string "Hitachi SH4" $archi }
	1a8	{ Write-Host $string "Hitachi SH5v" $archi }
	1c2	{ Write-Host $string "Thumb" $archi }
	169	{ Write-Host $string "MIPS little-endian WCE v2" $archi }
	default{ Write-Host "Couldn't find the PE of the program." }
}
