import binascii
import struct
import time
from bluepy.btle import UUID, Peripheral

uuid = UUID("d96a513d-a6d8-4f89-9895-ca131a0935cb")

p = Peripheral("00:07:80:77:C4:5A", "public")

try:
    ch = p.getCharacteristics()[0]
    if (ch.supportsRead()):
        while 1:
            val = binascii.b2a_hex(ch.read())
            print str(val) + ""
            time.sleep(1)

finally:
    p.disconnect()