#!/bin/sh

# Script pour convertir les fichiers pdf en image png
# On en profite pour rogner une partie de l image
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0710.pdf /home/fred/Images/d225_v4/0710_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0908.pdf /home/fred/Images/d225_v4/0908_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0810.pdf /home/fred/Images/d225_v4/0810_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/1008.pdf /home/fred/Images/d225_v4/1008_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0809.pdf /home/fred/Images/d225_v4/0809_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0711.pdf /home/fred/Images/d225_v4/0711_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0811.pdf /home/fred/Images/d225_v4/0811_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0909.pdf /home/fred/Images/d225_v4/0909_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/1010.pdf /home/fred/Images/d225_v4/1010_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/1009.pdf /home/fred/Images/d225_v4/1009_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0708.pdf /home/fred/Images/d225_v4/0708_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0709.pdf /home/fred/Images/d225_v4/0709_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/1011.pdf /home/fred/Images/d225_v4/1011_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0910.pdf /home/fred/Images/d225_v4/0910_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0808.pdf /home/fred/Images/d225_v4/0808_d225_384_068.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/Images/v4/0911.pdf /home/fred/Images/d225_v4/0911_d225_384_068.png
#

for i in `seq 0 500`;
do
   #convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/h/cartographie/pva/$i.png
  convert -density 75 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/hugin/pva2/$i.png
done
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/1.pdf /home/fred/h/cartographie/pva/1.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/2.pdf /home/fred/h/cartographie/pva/2.png
# convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/3.pdf /home/fred/h/cartographie/pva/3.png
