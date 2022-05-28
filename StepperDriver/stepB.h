#ifndef STEP
#define STEP

#include <iostream>
#include <wiringPi.h>
//#include"old/Step_Driver/temp.h"
#include"StepperMotor.hpp"
//#include"temp.h"

// RPi GPIO | WiringPi
    // -------------------
    // GPIO 17  |    0
    // GPIO 18  |    1
    // GPIO 27  |    2
    // GPIO 22  |    3

#define Apin 0
#define Bpin 1
#define Cpin 2
#define Dpin 3

#define CLOCKWISE 1
#define ANTICLOCKWISE 0
#define MOTOR_SPEED_DEFAULT 100

class _stepper {
    private:
        uint8_t clockwise[4] = {3,2,1,0};
        uint8_t anticlockwise[4] = {0,1,2,3};
        uint8_t pins[4] = {1,2,3,4};

        // StepperMotor object declaration
        //StepperMotor sm;

    private:
        uint8_t wiringPiSetup(void);

        void setup();

    public:
        _stepper();

        uint8_t Step_process(uint8_t dir,uint8_t step);

        uint8_t rotateStepper(uint8_t dir,uint8_t deg);

};

#endif