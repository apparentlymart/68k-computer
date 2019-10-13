package main

import (
	"fmt"
	"image"
	"image/png"
	"log"
	"os"
)

// There's room in our sprite RAM block for 8 16x16 sprites with four colors.
// The following slice must have eight elements in order for our result to be
// correct, but we can repeat images to fill out the list.
var images = []string{
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
	"mousepointer.png",
}

func main() {
	var data [512]byte
	for i, fn := range images {
		imOffset := i * 16 * 16 / 4
		f, err := os.Open(fn)
		if err != nil {
			log.Fatalf("failed to open %s: %s", fn, err)
		}
		imI, err := png.Decode(f)
		if err != nil {
			log.Fatalf("failed to decode %s as PNG image: %s", fn, err)
		}
		im, ok := imI.(*image.Paletted)
		if !ok {
			log.Fatalf("%s is not an indexed color image", fn)
		}
		if got, want := len(im.Palette), 4; got != want {
			log.Fatalf("%s has %d colors; want %d", fn, got, want)
		}
		bounds := im.Bounds()
		if bounds.Min.X != 0 || bounds.Min.Y != 0 || bounds.Max.X != 16 || bounds.Max.Y != 16 {
			log.Fatalf("%s is not 16x16 pixels (got %#v)", fn, bounds)
		}

		for y := 0; y < 16; y++ {
			for x := 0; x < 16; x += 4 { // We have four pixels packed into each byte in our result
				offset := imOffset + (y * 4) + (x / 4)
				for xb := 0; xb < 4; xb++ {
					clr := im.Pix[im.PixOffset(x+xb, y)]
					data[offset] |= byte(clr) << (uint(xb) * 2)
				}
			}
		}
	}

	var init [16][32]byte

	for i, b := range data {
		row := i / 16
		odd := 0
		if row > 15 {
			odd = 1
			row -= 16
		}
		column := (i%16)*2 + odd
		//fmt.Fprintf(os.Stderr, "data at offset %d (0x%02x) is stored in row %d column %d\n", i, b, row, column)
		init[row][column] = b
	}

	for ri, rowData := range init {
		fmt.Printf(".INIT_%X(256'b", ri)
		for ci := len(rowData) - 1; ci >= 0; ci-- {
			fmt.Printf("%08b", rowData[ci])
		}
		fmt.Println("),")
	}
}
