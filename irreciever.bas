symbol THIS_DEVICE_NUMBER=5
symbol INFRARED_BYTE=b0
symbol DEVICE_NUMBER=b1
symbol COMMAND=b2
main:
irin c.1,INFRARED_BYTE
DEVICE_NUMBER=INFRARED_BYTE/2/2/2 REM use highest 4 bits for device number
COMMAND=INFRARED_BYTE & %00000111
if DEVICE_NUMBER<>THIS_DEVICE_NUMBER then goto main
if COMMAND = 3 then goto redFlash
if COMMAND = 4 then goto greenFlash
goto main

redFlash:
pwmout C.2,99,299
pause 200
pwmout C.2,99,39
pause 200
goto main

greenFlash:
high C.4
pause 200
low C.4
pause 200
goto main
