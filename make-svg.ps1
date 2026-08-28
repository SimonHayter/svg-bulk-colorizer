# make svg

$svg = Get-Content -Raw -Path "example-logo.svg"
$data = Import-Csv -Path "tailwind-color-palette.csv" -Header "ColorName", "HexCode"

foreach ($row in $data) {
    $name = $row.ColorName
    $hex = $row.HexCode

    $newContent = $svg -replace "#FFFFFF", $hex
    $fileName = "example-$name-logo.svg"
    
    Set-Content -Path $fileName -Value $newContent
}
