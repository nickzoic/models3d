import machine
import time
import math

pwa = machine.PWM(machine.Pin(0), freq=20000, duty=1023)
in1 = machine.Pin(2, machine.Pin.OUT)
in2 = machine.Pin(15, machine.Pin.OUT)

pwb = machine.PWM(machine.Pin(4), freq=20000, duty=1023)
in3 = machine.Pin(25, machine.Pin.OUT)
in4 = machine.Pin(26, machine.Pin.OUT)

speed = 1/5
power = 900

try:
  while True:
    t = time.ticks_ms()
    a = (t/1000.)*50*speed*2*math.pi
    p1 = math.cos(a)
    p2 = math.sin(a)

    #print("%d %s %s" % (t, p1, p2))

    in1.value(p1>0)
    in2.value(p1<=0)
    pwa.duty(int(abs(p1)*power))

    in3.value(p2>0)
    in4.value(p2<=0)
    pwb.duty(int(abs(p2)*power))

except KeyboardInterrupt:
    pass

pwa.duty(0)
pwb.duty(0)

