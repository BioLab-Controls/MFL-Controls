#include"stepB.h"

int main(){
    _stepper *stepperobj = new _stepper();
    stepperobj -> rotateStepper(CLOCKWISE,90);
    delete stepperobj;
}