#!/bin/bash

ruby ../../scripts/screenshot.rb --url "https://genenetwork.org/" --out genenetwork-home.png
convert -extract 800x100+0+0 genenetwork-home.png global-search.png

ruby ../../scripts/screenshot.rb --url "https://genenetwork.org/gsearch?type=gene&terms=Brca2" --out global-search-gene.png --extract 800x300+0+0

ruby ../../scripts/screenshot.rb --url "https://genenetwork.org/show_trait?trait_id=1448542_at&dataset=HC_M2_0606_P"  --out gene-aliases.png --extract 800x800+0+0
