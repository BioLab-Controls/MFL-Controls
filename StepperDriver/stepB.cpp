#include <stdio.h>
#include <wiringPi.h>

#define Apin 1
#define Bpin 2
#define Cpin 3
#define Dpin 4

double process(double dir,double step){}

void main(){
    
    int wiringPiSetup(void);
    
    double clockwise[4] = {3,2,1,0};
    double anticlockwise[4] = {0,1,2,3};

    

    int map[4][4] = [
        [1,1,0,0]
        [0,1,1,0]
        [0,0,1,1]
        [1,0,0,1]
    ]

    for(uint8_t x=0;x<=3;++x){
        pinMode(clockwise[x],OUTPUT);
    }

    if(dir == 1){
        for(uint8_t i=0;i<=3;++i){
            for(uint8_t j=0;j<=3;++i){
                digitalWrite(pin,map[clockwise[i]][j]);
            }
        }
    }

    if(dir == 0){
        for(uint8_t i=3;i>=0;--i){
            for(uint8_t j=3;j>=0;--i){
                digitalWrite(pin,map[clockwise[i]][j]);
            }
        }
    }
}
    
