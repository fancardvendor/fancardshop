$files = @{
'Beyonce.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Beyonce.jpg'
'Lionel_Messi_31mar2007.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Lionel_Messi_31mar2007.jpg'
'Zendaya_-_2019_by_Glenn_Francis.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Zendaya_-_2019_by_Glenn_Francis.jpg'
'BTS_during_a_White_House_press_conference_May_31%2C_2022_(cropped).jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/BTS_during_a_White_House_press_conference_May_31%2C_2022_(cropped).jpg'
'Elon_Musk_2015.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Elon_Musk_2015.jpg'
'Taylor_Swift_%286966830273%29.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Taylor_Swift_%286966830273%29.jpg'
'Cristiano_Ronaldo.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Cristiano_Ronaldo.jpg'
'Rihanna_by_Rajasekharan_2019.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Rihanna_by_Rajasekharan_2019.jpg'
'Billie_Eilish_portrait.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Billie_Eilish_portrait.jpg'
'Neymar_Jr_Portrait_%28149008871%29_%28cropped%29.jpeg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Neymar_Jr_Portrait_%28149008871%29_%28cropped%29.jpeg'
'Dwayne_The_Rock_Johnson_2009_street_portrait.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Dwayne_The_Rock_Johnson_2009_street_portrait.jpg'
'Blackpink_Pink_Carpet_Event_4.jpg' = 'https://commons.wikimedia.org/wiki/Special:FilePath/Blackpink_Pink_Carpet_Event_4.jpg'
}
New-Item -ItemType Directory -Force -Path assets/images/celebrities
foreach ($k in $files.Keys) {
  Write-Host "Downloading $k ..."
  Invoke-WebRequest -Uri $files[$k] -OutFile ("assets/images/celebrities/" + $k) -UseBasicParsing
}
Write-Host "All downloads finished."
montage assets/images/celebrities/* -tile 6x2 -geometry +10+10 -background '#070707' miff:- | convert - -resize 1920x600^ -gravity center -extent 1920x600 -quality 90 assets/images/banner/banner.jpg
Write-Host "Banner created at assets/images/banner/banner.jpg"
