# SVG Bulk Colorizer & PNG Exporter

A fast, native PowerShell script that takes a single master SVG, generates hundreds of color variations from a CSV palette file, and batches them into multiple high-compression PNG resolutions using ImageMagick. 

Perfect for web designers, developers, and branding projects that require massive icon or logo sets in various themes and sizes.

## Features
*   **Bulk Color Replacement**: Instantly swaps a designated hex fill color inside a master SVG using a list of colors from a CSV.
*   **Dynamic Naming**: Automatically names new SVG files based on the color name and attributes in your dataset.
*   **OPTIONAL: Multi-Resolution PNG Export**: Loops through generated SVGs and creates perfectly scaled PNG8 files at targeted resolutions.
*   **OPTIONAL: Maximum Compression**: Utilizes ImageMagick's highest zlib compression and adaptive filtering for incredibly optimized web-ready PNGs.

## Prerequisites
*   Windows PowerShell
*   [ImageMagick](https://imagemagick.org/script/download.php) (Must be added to your system PATH)

## Need colors?

* See **bootstrap5-palette.csv**
* See **chakra-ui-palette.csv**
* See **ibm-carbon-design-system-palette.csv**
* See **md3-color-palette.csv**
* See **radix-palette.csv**
* See **tailwind-color-palette.csv**


## How to Use

1. Place your master SVG (e.g., `example-logo.svg`) in your working directory. Ensure the path or shape you want to change has a specific fill (like `#FFFFFF`).
2. Create a `colors.csv` file with no header row. Column 1 should be the color name (e.g., `red-50`), and Column 2 should be the hex code (e.g., `#FEF2F2`).
3. Run the generation script:

```powershell
$svg = Get-Content -Raw -Path "example-logo.svg"
$data = Import-Csv -Path "colors.csv" -Header "ColorName", "HexCode"

foreach ($row in$data) {
    $name =$row.ColorName
    $hex =$row.HexCode

    $newContent = $svg -replace "#FFFFFF", $hex
    $fileName = "example-$name-logo.svg"
    
    Set-Content -Path $fileName -Value$newContent
}
