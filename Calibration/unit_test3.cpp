#include"_calib.h"

int main(){
    _calibration *calBobj = new _calibration();
    calBobj -> start_calibration();
    delete calBobj;

}