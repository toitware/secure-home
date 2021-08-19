import gpio
 
main:
 pin := gpio.Pin 26 --input
 led := gpio.Pin 33 --output
 while(true):
   if pin.get==0:
       print "Door open"
       led.set 1
   sleep --ms=500
   led.set 0