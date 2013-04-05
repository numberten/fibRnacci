library(tuneR)

#Run using 'Rscript fibgen.r <a> <b> <songname>'

a <- 0
b <- 0

#lower <- as.numeric(commandArgs()[6])
#upper <- as.numeric(commandArgs()[7])
#songname <- commandArgs()[8]

notes <- list('C1' = sine(261, bit=8), 'D' = sine(294, bit=8), 'E' = sine(329, bit=8), 'F' = sine(349, bit=8), 'G' = sine(392, bit=8), 'A' = sine(440, bit=8), 'B' = sine(490, bit=8), 'C2' = sine(523, bit=8))

digits <- function(n) {
   if (n == 0) { return('C1') }
   if (n == 1) { return('D')  }
   if (n == 2) { return('E')  }
   if (n == 3) { return('F')  }
   if (n == 4) { return('G')  }
   if (n == 5) { return('A')  }
   if (n == 6) { return('B')  }
   }

getNote <- function(n) {
   m <- digits(n)
   return(notes[[m]])
   }

# R doesn't have tail recursion, inefficient, but not in implementation.
#fib <- function(n) {
#   if (n == 0) { return(0) }
#   if (n == 1) { return(1) }
#   else { return(fib(n-1) + fib(n-2)) }
#   }

nextFib <- function() {
   c <- (a + b) %% 7
   assign("a", b, envir = .GlobalEnv)
   assign("b", c, envir = .GlobalEnv)
   return(c)
   }

main <- function(s1, s2, t) {
   t <- t - 2
   assign("a", (s1 %% 7), envir = .GlobalEnv)
   assign("b", (s2 %% 7), envir = .GlobalEnv)
   xs <- c(a, b)
   while (t > 0) {
      xs <- c(xs, nextFib())
      t <- t - 1
   }
   return(xs)
}

generateTrack <- function(xs) {
   song <- bind(getNote(xs[1]))
   xs <- xs[-1]
   for (i in xs) {
      song <- bind(song, getNote(i))
   }
   return(song)
}

generateSong <- function(song, songname) {
   writeWave(song, paste("../music/", songname, ".wav", sep=""))
}

#writeWave(song, paste("../music/", songname, ".wav", sep=""))
#play(song, 'vlc')
