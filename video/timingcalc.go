package main

import (
	"fmt"
	"math"
)

// This is a simple Go program to find (by brute force) the PLL settings that
// will get closest to our desired pixel clock frequency.
//
// This is not an elegant way to solve this problem, but it's a straightforward
// way given that the domain of all of the input variables is constrained to
// a relatively small set of integers.
//
// Run it as follows:
//    go run timingcalc.go

// Frequencies are in MHz, though the unit doesn't actually matter as long
// as we're consistent.
//const freqIn = 12
const freqIn = 48
const freqWant = 74.25

type result struct {
	freq             float64
	freqDelta        float64
	divF, divQ, divR int
}

func main() {
	var best result
	best.freqDelta = math.Inf(1)

	for divF := 0; divF < 64; divF++ {
		for divQ := 1; divQ <= 6; divQ++ {
			for divR := 0; divR < 16; divR++ {
				got := calc(float64(divF), float64(divQ), float64(divR))
				delta := math.Abs(got - freqWant)
				if delta < best.freqDelta {
					best.freq = got
					best.freqDelta = delta
					best.divF = divF
					best.divQ = divQ
					best.divR = divR
				}
			}
		}
	}
	fmt.Printf("best is %#v\n", best)
	fmt.Printf(
		"  %g = (%g MHz * (%d + 1)) / ((2 ^ %d) * (%d + 1))\n",
		best.freq, float64(freqIn), best.divF, best.divQ, best.divR,
	)
}

func calc(divF, divQ, divR float64) float64 {
	return (freqIn * (divF + 1)) / (math.Pow(2, divQ) * (divR + 1))
}
