import gpio
import gpio.adc

main:
  threshold := 2.5
  ADC1 ::= adc.Adc (gpio.Pin.in 34)
  if(ADC1.get > threshold):
    print "Light is on"