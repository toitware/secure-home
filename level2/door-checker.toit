// Copyright (C) 2021 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

/**
Program that listens on input: a magnetic door sensor connected via pin 26.
And turns on an LED when the door is open.
*/

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
