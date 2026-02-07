from gpiozero import Button
from subprocess import call
from signal import pause

btn = Button(25, pull_up=True, bounce_time=0.1)

def run_script():
    call(["/usr/local/bin/mupibox/button.sh"])

btn.when_released = run_script
pause()
