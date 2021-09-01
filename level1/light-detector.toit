// Copyright (C) 2021 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

/**
Program measuring the lighting level using a photoresistor.
It prints an alert if the level is above the chosen threshold.
*/

import gpio
import gpio.adc

ADC1 ::= adc.Adc (gpio.Pin.in 34)

main:
  threshold := 3
  if ADC1.get > threshold:
    print "Light is on"
