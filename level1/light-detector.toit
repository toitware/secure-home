// Copyright (C) 2021 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

/**
Program measuring the lighting level using a photoresistor,
and printing the status in the logs.
*/

import gpio
import gpio.adc

main:
  threshold := 2.5
  ADC1 ::= adc.Adc (gpio.Pin.in 34)
  if(ADC1.get > threshold):
    print "Light is on"
