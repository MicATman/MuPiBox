import uinput
from evdev import InputDevice, categorize, ecodes

# Maus-Device öffnen (prüfe vorher mit: ls /dev/input/by-id/)
# device_path = '/dev/input/by-id/usb-Logitech_USB_Optical_Mouse-event-mouse'
device_path = '/dev/input/by-id/usb-Microsoft_Microsoft_Basic_Optical_Mouse-event-mouse'   # anpassen!
mouse = InputDevice(device_path)

# Uinput-Gerät anlegen
keyboard = uinput.Device([uinput.KEY_RIGHT,uinput.KEY_LEFT])

for event in mouse.read_loop():
    if event.type == ecodes.EV_REL:   # relative Bewegung (z. B. Rad)
        if event.code == ecodes.REL_WHEEL:
            if event.value > 0:   # Rad nach oben
                keyboard.emit_click(uinput.KEY_LEFT)
            elif event.value < 0: # Rad nach unten
                keyboard.emit_click(uinput.KEY_RIGHT)
pause()
