#ifndef STEP
#define STEP

#include <iostream>
#include <wiringPi.h>
//#include"old/Step_Driver/temp.h"
//#include"temp.h"

#define Apin 1
#define Bpin 2
#define Cpin 3
#define Dpin 4

#define CLOCKWISE 1
#define ANTICLOCKWISE 0

class _stepper {
    private:
        uint8_t clockwise[4] = {3,2,1,0};
        uint8_t anticlockwise[4] = {0,1,2,3};
        uint8_t pins[4] = {1,2,3,4};

    private:
        uint8_t wiringPiSetup(void);

    public:
        _stepper();

        uint8_t Step_process(uint8_t dir,uint8_t step);

};

#endif