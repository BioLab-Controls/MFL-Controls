#include<iostream>
#include"../module_input.h"

int main(){
    _moduleInput *SPobject = new _moduleInput();
    double flow_data = SPobject -> getFlowData();
    std::cout << flow_data;
    //Remove object 
    delete SPobject;
    return 0;
}