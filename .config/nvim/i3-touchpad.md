
This method affects all window managers on your machine, so keep that in mind. Make a new file at /etc/X11/xorg.conf.d/touchpad-tap.conf and add the following:

Copy
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
EndSection
