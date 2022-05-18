#include "step.h"

void setup(){
    wiringSetup();

    pinMode(stp,OUTPUT)
    pinMode(dir,OUTPUT)
}

int main(void){
    
    printf("RPI-Blink")

    wiringSetup();

    // Loop for steps
    for(;;){
        digitalWrite(LED,1);
        delay(500);
        digitalWrite(LED,0);
        delay(500);
    }

    return 0;
}





