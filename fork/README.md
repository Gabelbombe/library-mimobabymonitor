# Some background on the sensor
* http://mimobaby.com/community/understanding-mimo-motion/
* http://mimobaby.com/community/how-our-respiration-sensors-work/

# Data format 
This is courtesy of Carson Darling per https://forum.quantifiedself.com/t/tapping-into-mimo-smart-baby-monitor/1758

    Byte    Name            Description
    =========================================================
    00      Turtle ID       3 byte TurtleID
    01
    02      
    --------------------------------------------------------
    03      Packet Identifier
    04      
    ---------------------------------------------------------
    05      Respiration     5x 16-bit samples, starting
    06                      with the oldest, big-endian
    07      
    08      
    09      
    10      
    11      
    12      
    13      
    14
    ---------------------------------------------------------
    15      Acceleration    One byte per axis, in order of
    16                      X, Y, Z, signed
    17      
    ---------------------------------------------------------
    18      Temperature     Relative scale
    ---------------------------------------------------------
    19      Battery         0-100%


    For example:
    aaed18009d0a3b0a3a0a370a350a380300b99558
    aaed18 - Turtle ID
          009d - Packet identifier
              0a3b - Respiration #1
                  0a3a - Respiration #2
                      0a37 - Respiration #3
                          0a35 - Respiration #4
                              0a38 - Respiration #5
                                  03 - X axis
                                    00 - Y axis
                                      b9 - Z axis
                                        95 - Relative temperature
                                          58 - Battery
