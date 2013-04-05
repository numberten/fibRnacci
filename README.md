8-bit Fibonacci Music
=====================

The goal behind this [Vi Hart](http://vihart.com/) spirited project is to create a simple song generator, where each note corresponds to a fibonacci number. All fibonacci numbers are modded by 7, generating digits between 0 and 6, all of which have been assigned unique notes from a major scale. Since only the previous two mods are needed to calculate the next one, there is no need to derive mods from actual fibonacci numbers. This allows for a constant stream of consecutive fibonnaci mods to be generated without delay or risk of stack overflow.

