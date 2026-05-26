# Download all images and PDFs from the old Bright Futures School site
# Run once from the repo root: .\scripts\download-assets.ps1

$baseUrl  = "https://www.brightfuturesschool.co.uk/wp-content/uploads"
$imgDir   = "public\images\gallery"
$badgeDir = "public\images\badges"
$docDir   = "public\documents"

foreach ($dir in @($imgDir, $badgeDir, $docDir, "public\images")) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
}

function Get-File($url, $dest) {
    if (Test-Path $dest) { Write-Host "  SKIP  $dest"; return }
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -ErrorAction Stop
        Write-Host "  OK    $dest"
    } catch {
        Write-Host "  FAIL  $dest  ($_)"
    }
}

Write-Host "`n=== Logo / hero images ==="
Get-File "$baseUrl/2020/03/Bright-Futures-01.jpg"  "public\images\logo.jpg"
Get-File "$baseUrl/2020/03/Bright-Futures-04-1.jpg" "public\images\hero-school.jpg"
Get-File "$baseUrl/2020/02/2051072-3013.jpg"        "public\images\school-exterior.jpg"
Get-File "$baseUrl/2020/02/sensory-room.jpg"        "public\images\sensory-room.jpg"
Get-File "$baseUrl/2020/02/2051093-3034.jpg"        "public\images\pupils-group.jpg"
Get-File "$baseUrl/2020/03/bfs-ofsted-good-school.png" "public\images\bfs-ofsted-good-school.png"
Get-File "$baseUrl/2020/02/QIA-Award-Logo-1-1.jpg"  "public\images\qia-award.jpg"
Get-File "$baseUrl/2020/03/Bright-Futures-01.jpg"   "public\images\favicon.jpg"

Write-Host "`n=== Gallery images ==="
$galleryImages = @(
    @{ url="$baseUrl/2020/03/Bright-Futures-15.jpg";        dest="$imgDir\bright-futures-15.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-04-2.jpg";      dest="$imgDir\bright-futures-04.jpg" },
    @{ url="$baseUrl/2020/03/Henry-at-Dovestones-.jpg";     dest="$imgDir\henry-at-dovestones.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-14v3.jpg";      dest="$imgDir\bright-futures-14.jpg" },
    @{ url="$baseUrl/2020/03/bfs-staff-team-1.jpg";         dest="$imgDir\bfs-staff-team.jpg" },
    @{ url="$baseUrl/2020/03/Matthew-and-Harry-look-at-screen-2.jpg"; dest="$imgDir\matthew-and-harry.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-03-2.jpg";      dest="$imgDir\bright-futures-03.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-13.jpg";        dest="$imgDir\bright-futures-13.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-12.jpg";        dest="$imgDir\bright-futures-12.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-11-1.jpg";      dest="$imgDir\bright-futures-11.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-10.jpg";        dest="$imgDir\bright-futures-10.jpg" },
    @{ url="$baseUrl/2020/03/flynn.jpg";                    dest="$imgDir\flynn.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-09.jpg";        dest="$imgDir\bright-futures-09.jpg" },
    @{ url="$baseUrl/2020/03/Sahil-and-Henry-in-the-wind-.jpg"; dest="$imgDir\sahil-and-henry-in-the-wind.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-07.jpg";        dest="$imgDir\bright-futures-07.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-06.jpg";        dest="$imgDir\bright-futures-06.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-05-1.jpg";      dest="$imgDir\bright-futures-05.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-03-1.jpg";      dest="$imgDir\bright-futures-03b.jpg" },
    @{ url="$baseUrl/2020/03/Bright-Futures-02-1.jpg";      dest="$imgDir\bright-futures-02.jpg" },
    @{ url="$baseUrl/2020/03/Saoirse-makes-gingerbread-men.jpg"; dest="$imgDir\saoirse-makes-gingerbread.jpg" },
    @{ url="$baseUrl/2020/03/Sahil-by-posts-at-Dovestones.jpg";  dest="$imgDir\sahil-by-posts-at-dovestones.jpg" },
    @{ url="$baseUrl/2020/03/Sahil-and-Henry-in-woods-at-Dovestones-.jpg"; dest="$imgDir\sahil-and-henry-in-woods.jpg" },
    @{ url="$baseUrl/2021/09/Matthew-going-to-College-July-2021-150x150.jpg"; dest="$imgDir\matthew-going-to-college.jpg" },
    @{ url="$baseUrl/2021/09/Pupils-on-sensory-equipment-150x150.jpg";        dest="$imgDir\pupils-on-sensory-equipment.jpg" },
    @{ url="$baseUrl/2021/09/Nojus-on-equipment-150x150.jpg";                 dest="$imgDir\nojus-on-equipment.jpg" },
    @{ url="$baseUrl/2021/09/B-R-swim-session-150x150.jpg";                   dest="$imgDir\swim-session.jpg" },
    @{ url="$baseUrl/2021/09/Lucy-and-Breeze-2-150x150.jpg";                  dest="$imgDir\lucy-and-breeze.jpg" },
    @{ url="$baseUrl/2021/09/Jayden-on-equipment-150x150.jpg";                dest="$imgDir\jayden-on-equipment.jpg" }
)
foreach ($img in $galleryImages) { Get-File $img.url $img.dest }

Write-Host "`n=== Accreditation badges ==="
Get-File "$baseUrl/2020/02/ssat-member.png"                                    "$badgeDir\ssat-member.png"
Get-File "$baseUrl/2020/02/asdan-registered.png"                               "$badgeDir\asdan-registered.png"
Get-File "$baseUrl/2020/02/blue_large_final-Click-CEOP-gif-3-1.gif"            "$badgeDir\ceop-click.gif"

Write-Host "`n=== PDFs and documents ==="
$docs = @(
    @{ url="https://www.brightfuturesschool.co.uk/wp-content/uploads/2023/11/prospectus-1123.pdf"; dest="$docDir\prospectus-1123.pdf" },
    @{ url="https://www.brightfuturesschool.co.uk/wp-content/uploads/2025/01/SEND-Information-Report-2.pdf"; dest="$docDir\SEND-Information-Report-2.pdf" },
    @{ url="https://www.brightfuturesschool.co.uk/wp-content/uploads/2020/02/Early-stage-SEN.pdf"; dest="$docDir\Early-stage-SEN.pdf" },
    @{ url="https://www.brightfuturesschool.co.uk/wp-content/uploads/2021/01/PBS-vs-developmental.pdf"; dest="$docDir\PBS-vs-developmental.pdf" },
    @{ url="https://www.brightfuturesschool.co.uk/wp-content/uploads/2020/11/SC-and-RDI.pdf"; dest="$docDir\SC-and-RDI.pdf" }
)
foreach ($doc in $docs) { Get-File $doc.url $doc.dest }

Write-Host "`nNote: Policy PDFs need to be obtained directly from Zoe or the school server."
Write-Host "Volunteer Application Form and First Contact Form are DOCX files — obtain from the old WP admin or Zoe."
Write-Host "`nDone."
