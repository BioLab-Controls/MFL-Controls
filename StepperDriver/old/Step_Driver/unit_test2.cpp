#include<iostream>
#include"stepB.h"

int main(){
    _stepper *stepperobject = new _stepper();

    double _data = stepperobject -> Step_process(1,5);
    //Remove object 
    delete stepperobject;
    return 0;
}
