#! /bin/bash


mkdir ~/.config/bspwm && mkdir ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd

if test -f "~/.xsessionrc"; then
  echo "#!/bin/bash" >> ~/.xsessionrc;
  echo "exec bspwm" >> ~/.xsessionrc;
else
  touch ~/.xsessionrc;
  echo "#!/bin/bash" >> ~/.xsessionrc;
  echo "exec bspwm" >> ~/.xsessionrc;
fi

chmod u+x ~/.config/bspwm/bspwmrc;
chmod u+x ~/.xsessionrc;
