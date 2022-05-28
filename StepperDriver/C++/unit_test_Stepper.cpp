#include"stepB.h"
#include<wiringPi.h>

int main(){
    _stepper *stepperobj = new _stepper();
    wiringPiSetupGpio();
    stepperobj -> rotateStepper(CLOCKWISE,90);

    delete stepperobj;
}