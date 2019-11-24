import machine
import time
import math

pwa = machine.PWM(machine.Pin(0), freq=1000, duty=1023)
in1 = machine.Pin(2, machine.Pin.OUT)
in2 = machine.Pin(15, machine.Pin.OUT)

pwb = machine.PWM(machine.Pin(4), freq=1000, duty=1023)
in3 = machine.Pin(0, machine.Pin.OUT)
in4 = machine.Pin(4, machine.Pin.OUT)

while True:
    t = time.ticks_us()
    p1 = math.cos(t/10000)
    p2 = math.sin(t/10000)

    #print("%d %s %s" % (t, p1, p2))

    in1.value(p1>0.5)
    in2.value(p1<-0.5)
    pwa.duty(int(abs(p1)*1023))

    in3.value(p2>0.5)
    in4.value(p2<-0.5)
    pwb.duty(int(abs(p2)*1023))

    print("%d %s %s %d %d %d %d %d %d" % (t, p1, p2, in1.value(), in2.value(), in3.value(), in4.value(), pwa.duty(), pwb.duty() ))
