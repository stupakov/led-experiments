## Running VNC on raspberry pi

`tightvncserver`

Use `raspberrypi.local:5901` to connect.

## SSH onto raspberry pi

`ssh pi@raspberrypi.local  #password: raspberry`

## Fadecandy

Build the fadecandy server binary by following instructions in `src/fadecandy/server/README.md`

## Setting up ssh tunnel from raspberry pi

This can be done if you need to send Open Pixel Control data from Processing to the simulator on the host machine (rather than to the `fcserver` running on the Raspberry Pi)

First, ensure the workstation has access enabled:
```
System Preferences | Sharing | Internet sharing
- enable Remote Login for ssh access
- enable internet sharing for RNDIS/Ethernet Gadget
```

Then establish the tunnel:

`ssh -nNT -L 7890:localhost:7890 user@ip`
## TODO

[_] autostart scripts on rpi
[_] connect to LED hardware on rpi
[_] development workflow for animations on mac (emulator-based)
