# make-png

$sizes = @(64, 128, 165, 200, 215, 250, 256, 320, 400, 480, 500, 512, 720, 800, 1024, 2048, 4096)
$svgFiles = Get-ChildItem -Filter "*.svg" -Recurse

foreach ($file in $svgFiles) {
    foreach ($size in $sizes) {
        $newName = "$($file.DirectoryName)\$($file.BaseName)-$size.png"
        magick -background none $file.FullName -resize "${size}x${size}" -quality 95 "png8:$newName"
    }
}
