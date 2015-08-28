package main

import (
	"fmt"
	"log"

	"github.com/PuerkitoBio/goquery"
)

func main() {
	doc, err := goquery.NewDocument("https://studentenwerk-dresden.de/mensen/speiseplan")
	if err != nil {
		log.Fatal(err)
	}

	doc.Find("table.speiseplan").Each(func(i int, s *goquery.Selection) {
		canteenName := s.Find("th.text").Text()
		fmt.Println(canteenName)
	})
}
