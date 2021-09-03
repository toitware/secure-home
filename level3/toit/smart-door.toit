// Copyright (C) 2021 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.

/**
Toit program that demonstrates the Publish/Subscribe messaging service provided by the Toit cloud, 
  to send and receive messages from your IoT devices and receiving these messages in your own backend
  or client application.
This example shows a smart home security system that listens on a magnetic door switch and sends 
  a message using PubSub subscriptions when the door status changes.
*/

import gpio
import pubsub


// Topics:
INCOMING_TOPIC ::= "cloud:door/in"
OUTGOING_TOPIC ::= "cloud:door/out"

// Pin definitions:
pin ::= gpio.Pin 26 --input
led ::= gpio.Pin 33 --output 

// Logic variables: 
alarm_activated := true
is_door_open := false


main:
  task:: subscriber_publisher
  task:: door_check

// Three states can be triggered via pubsub. Use the python program to fire the triggers:
subscriber_publisher: 
  pubsub.subscribe INCOMING_TOPIC --auto_acknowledge: | msg/pubsub.Message |
    if msg.payload.to_string == "on":
      pubsub.publish OUTGOING_TOPIC "Alarm activated"
      alarm_activated = true
    if msg.payload.to_string == "off":
      pubsub.publish OUTGOING_TOPIC "Alarm deactivated"
      alarm_activated = false
    if msg.payload.to_string == "status":
      pubsub.publish OUTGOING_TOPIC "alarm activated: $alarm_activated"

// Basic logic for the door checker:
door_check: 
  while true:
    if not alarm_activated:
      led.set 0
      sleep --ms=500
      continue
    
    old_is_open := is_door_open
    pin_value := pin.get
    is_door_open = pin_value == 0

    if old_is_open != is_door_open:
      if is_door_open:
        print "Door open"
        pubsub.publish OUTGOING_TOPIC "Door open"
      else:
        print "Door closed"
        pubsub.publish OUTGOING_TOPIC "Door closed"
    led.set pin_value
    sleep --ms=500
