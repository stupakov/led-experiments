## Running VNC on raspberry pi

`tightvncserver`

Use `raspberrypi.local:5901` to connect.

## SSH onto raspberry pi

`ssh pi@raspberrypi.local  #password: raspberry`

## Setting up ssh tunnel from raspberry pi

First, ensure the workstation has access enabled:
```
System Preferences | Sharing | Internet sharing
- enable Remote Login for ssh access
- enable internet sharing for RNDIS/Ethernet Gadget
```

### Discover the IP address of the workstation

```
ifconfig
ping -b <inet address of usb0>
```

### Establish the tunnel

`ssh -nNT -L 7890:localhost:7890 user@ip`

or

`ssh -nNT -L 7890:localhost:7890 user@hostname.lan`

## Fadecandy

Build the fadecandy server binary by following instructions in `src/fadecandy/server/README.md`

## TODO

[_] autostart scripts on rpi
[_] connect to LED hardware on rpi
[_] development workflow for animations on mac (emulator-based)
