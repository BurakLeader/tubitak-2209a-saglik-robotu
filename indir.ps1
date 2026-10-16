# indir.ps1 - TÜBİTAK 2209-A Otomatik Kurulum ve İndirme Betiği
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "   ____  ___  ____  ___        _      ____    _    ____ _     ___ _  __" -ForegroundColor Green
Write-Host "  |___ \|___ \ / _ \/ _ \      / \    / ___|  / \  / ___| |   |_ _| |/ /" -ForegroundColor Green
Write-Host "    __) | __) | | | | (_) |____/ _ \   \___ \ / _ \| |  _| |    | || ' / " -ForegroundColor Green
Write-Host "   / __/ / __/| |_| |\__, |___/ ___ \   ___) / ___ \ |_| | |___ | || . \ " -ForegroundColor Green
Write-Host "  |_____|_____|\___/   /_/   /_/   \_\ |____/_/   \_\____|_____|___|_|\_\" -ForegroundColor Green
Write-Host ""
Write-Host "   [TÜBİTAK 2209-A] AKILLI SAĞLIK ROBOTU PROJE PAKETİ İNDİRİCİ v2.0" -ForegroundColor Yellow
Write-Host "   Ekip: Dilara GEDÜK | Arda AKKUŞ | Burak DEMİR" -ForegroundColor White
Write-Host "   Danışman: Öğr. Gör. Muhammed Canhakan BODUR" -ForegroundColor DarkCyan
Write-Host "======================================================================`n" -ForegroundColor Cyan

$hedefKlasor = "$env:USERPROFILE\Desktop\TUBITAK_2209A_Proje_Dosyalari"
if (!(Test-Path -Path $hedefKlasor)) {
    New-Item -ItemType Directory -Path $hedefKlasor | Out-Null
}

$baseUrl = "https://raw.githubusercontent.com/BurakLeader/tubitak-2209a-saglik-robotu/main"
$dosyalar = @(
    "TUBITAK_2209A_Akilli_Saglik_Robotu_Basvuru.docx",
    "TUBITAK_2209A_Akilli_Saglik_Robotu_Basvuru.pdf",
    "TUBITAK_2209A_Proje_Sunumu.pptx",
    "muhendislik_akis_semasi.png"
)

foreach ($dosya in $dosyalar) {
    Write-Host "[*] İndiriliyor: $dosya ..." -ForegroundColor Yellow -NoNewline
    Start-Sleep -Milliseconds 400
    Invoke-WebRequest -Uri "$baseUrl/$dosya" -OutFile "$hedefKlasor\$dosya"
    Write-Host " [TAMAMLANDI ✓]" -ForegroundColor Green
}

Write-Host "`n[+] Tüm proje dosyaları ve karar ağacı şeması Masaüstüne indirildi!" -ForegroundColor Cyan
Write-Host "[+] Klasör otomatik olarak açılıyor..." -ForegroundColor Green
Start-Sleep -Seconds 1
Invoke-Item $hedefKlasor
