library(tuneR)

a <- 0
b <- 1

lower <- as.numeric(commandArgs()[6])
upper <- as.numeric(commandArgs()[7])

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

fib <- function(n) {
   if (n == 0) { return(0) }
   if (n == 1) { return(1) }
   else { return(fib(n-1) + fib(n-2)) }
   }

nextFib <- function() {
   c <- (a + b) %% 7
   assign("a", b, envir = .GlobalEnv)
   assign("b", c, envir = .GlobalEnv)
   return(c)
   }

song <- bind(getNote(0), getNote(1))
for (i in (lower:upper)) {
   song <- bind(song, getNote(nextFib()))
   }

writeWave(song, 'fib.wav')
#play(song, 'vlc')
