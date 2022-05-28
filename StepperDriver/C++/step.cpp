#include "step.h"

void setup(){
    wiringSetup();

    pinMode(stp,OUTPUT)
    pinMode(dir,OUTPUT)
}

int main(void){
    
    printf("RPI - MFL TEST")

    wiringSetup();

    for(;;){
        digitalWrite(stp,1);
        delay(500);
        digitalWrite(stp,0);
        delay(500);
    }
    
    return 0;
}





