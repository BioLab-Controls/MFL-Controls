#include "stepB.h"

_stepper::_stepper(){
    setup();
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
  
void _stepper::setup(){
     sm.setGPIOutputs(Apin, Bpin, Cpin, Dpin);
}

  uint8_t _stepper::rotateStepper(uint8_t dir,uint8_t deg){
      //default 100 PERCENT MOTOR SPEED
      //5ms wait time per degree
      if(dir == CLOCKWISE){
          sm.run(1,deg,MOTOR_SPEED_DEFAULT);
          sm.wait(deg * 5);
      }
      if(dir == CLOCKWISE){
          sm.run(-1,deg,MOTOR_SPEED_DEFAULT);
          sm.wait(deg * 5);
      }
      return 1;
  }

    
    
