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
	"testpattern.png",
	"testpattern2.png",
	"testpattern.png",
	"testpattern.png",
	"testpattern.png",
	"testpattern.png",
	"testpattern.png",
}

func main() {
	var pixels [2048]byte // each value between 0 and 3 inclusive
	for i, fn := range images {
		imOffset := i * 16 * 16
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
			for x := 0; x < 16; x++ {
				offset := imOffset + (y * 16) + x
				clr := im.Pix[im.PixOffset(x, y)]
				pixels[offset] = byte(clr)
			}
		}
	}

	var init [256]uint16

	for i, b := range pixels {
		clr := uint16(b)
		cell := i & 0xff
		shift := uint(i) >> 8
		//mask := ((clr & 1 << 8) | (clr & 2 >> 1)) << shift
		mask := ((clr & 2 << 7) | (clr & 1)) << shift
		fmt.Printf("pixel %03x has color %x and is written as %016b into cell %02x\n", i, clr, mask, cell)
		if (init[cell] & mask) != 0 {
			fmt.Printf("warning: pixel %03x (color %x, mask %016b) is overlapping existing bits\n", i, clr, mask)
		}
		init[cell] |= mask
	}

	for ri := 0; ri < 16; ri++ {
		offset := ri * 16
		rowData := init[offset : offset+16]
		fmt.Printf(".INIT_%X(256'b", ri)
		for ci := len(rowData) - 1; ci >= 0; ci-- {
			fmt.Printf("%016b", rowData[ci])
		}
		fmt.Println("),")
	}
}
