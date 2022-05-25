#ifndef CALIBRATION
#define CALIBRATION

/*Stepper motor calibration function process
- Run the valve from closed state to open state 
- Log flow/pressure for the full close to open cycle
- Plot the data and find the equation of the line (MATLAB)*/

#include<iostream>
#include <ctime>
#include"../StepperDriver/stepB.h"

#define FLAG 0

class _calibration {
    private:
        //- Run the valve from closed state to open state 
        uint8_t valveCycle(uint8_t degrees);

        //Reset valve to open
        uint8_t resetValve();

        uint8_t outputToCSV();

        //Return time NOW
        uint8_t pushTime();

    public:
        //Constructor
        _calibration();

        uint8_t start_calibration();

};

#endif