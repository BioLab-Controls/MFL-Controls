#include <stdio.h>
#include <wiringPi.h>

double process(double dir,double step){}

void setup(){
    int wiringPiSetup(void);
}

void main(){
    double clockwise[4] = {3,2,1,0};
    double anticlockwise[4] = {0,1,2,3};

    int map[4][4] = [
        [1,1,0,0]
        [0,1,1,0]
        [0,0,1,1]
        [1,0,0,1]
    ]

    if(dir == 1){
        for(uint8_t i=0;i<3;++i){
            for(uint8_t j=0;j<3;++i){
            // Write Pins Here
            }
        }
    }

    if(dir == 0){
        for(uint8_t i=3;i>=0;--i){
            for(uint8_t j=3;j>=0;--i){
            // Write Pins Here
            }
        }
    }
}
    
