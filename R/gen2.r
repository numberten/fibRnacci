source("fibgen.r")

a <- main(0,1,30)
track <- bind(generateTrack(a))
b <- main(1,3,30)
track <- bind(track + generateTrack(b))
c <- main(2,4,30)
track <- bind(track + generateTrack(c))

generateSong(normalize(track, unit='8'),"kasia")
