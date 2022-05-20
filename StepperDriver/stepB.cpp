#include "stepB.h"

_stepper::_stepper(){
    wiringPiSetup();
}

uint8_t _stepper::Step_process(uint8_t dir,uint8_t step){
    uint8_t map[4][4] = {
            {1,1,0,0},
            {0,1,1,0},
            {0,0,1,1},
            {1,0,0,1}
        };

    if(dir == CLOCKWISE){
        for(uint8_t i = 0;i <= 3;++i){
            for(uint8_t j = 0;j <= 3;++i){
                digitalWrite(pins[j],map[clockwise[i]][j]);
            }
        }
    }
    if(dir == ANTICLOCKWISE){
        for(uint8_t i = 0;i <= 3;++i){
            for(uint8_t j = 0;j <= 3;++i){
                digitalWrite(pins[j],map[anticlockwise[i]][j]);
            }
        }
    }    
    return 1;
}
  
uint8_t _stepper::wiringPiSetup(void){
    pinMode(Apin,OUTPUT);
    pinMode(Bpin,OUTPUT);
    pinMode(Cpin,OUTPUT);
    pinMode(Dpin,OUTPUT);
}

    
  

    
    
