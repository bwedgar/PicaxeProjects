symbol THIS_DEVICE_NUMBER=%101
symbol INFRARED_BYTE=b0
symbol DEVICE_NUMBER=b1
symbol COMMAND=b2
main:
irin c.2,INFRARED_BYTE
REM debug
REM INFRARED_BYTE=%00101011
pause 200 
DEVICE_NUMBER=INFRARED_BYTE/2/2/2 REM use highest 4 bits for device number
COMMAND=INFRARED_BYTE & %00000111
if DEVICE_NUMBER<>THIS_DEVICE_NUMBER then goto main
if COMMAND <> 3 then goto main
high C.1
pause 200
low C.1
pause 200
goto main             