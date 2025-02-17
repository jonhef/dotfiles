#!/bin/bash

PAGE_SIZE=$(pagesize | sed 's/\.//g')
PAGES_INACTIVE=$(vm_stat | awk '/^Pages inactive:/{print $NF}' | sed 's/\.//g')
PAGES_FREE=$(vm_stat | awk '/^Pages free:/{print $NF}' | sed 's/\.//g')
PAGES_SPEC=$(vm_stat | awk '/^Pages speculative:/{print $NF}' | sed 's/\.//g')
PAGES_COMP=$(vm_stat | awk '/^Pages compressions:/{print $NF}' | sed 's/\.//g')
PAGES=$(( PAGES_WIRED+PAGES_FREE+PAGES_INACTIVE+PAGED_SPEC+PAGES_COMP ))
mem=$(( PAGES*PAGE_SIZE ))
fullmem=$(( `sysctl -n hw.memsize` ))
per=$(bc<<<"scale=4;$mem/$fullmem")
per_real=$(bc<<<"scale=4;1-$per")
sketchybar --push "$NAME" "0$per_real"
per_real1=$(bc<<<"scale=0;$per_real*100")
per_real2="${per_real1::${#per_real1}-2}"
sketchybar --set "$NAME" label="$per_real2%"


