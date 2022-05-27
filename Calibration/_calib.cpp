#include"_calib.h"

_calibration::_calibration(){
    //Reset valve to fully open
    resetValve();
}

//- Run the valve from open state to closed state 
uint8_t _calibration::valveCycle(uint8_t degrees){
    //_stepper *obj = new _stepper();
    //If flag shows a reset
    if(FLAG == 1){
        //obj -> rotateStepper(CLOCKWISE,degrees);
    }
}

//Reset valve to open
uint8_t _calibration::resetValve(){
    //Move position to OPEN STATE () by causing a full rotation and setting flag to OPEN
    //_stepper *obj = new _stepper();
    uint16_t full_rotation_back = 360;
    //obj -> rotateStepper(ANTICLOCKWISE,full_rotation_back);
    //delete obj;
    //define valve state flag to be open
    #undef FLAG
    #define FLAG 1
}

uint8_t _calibration::outputToCSV(){
      std::ofstream file;
      file.open("valveData.csv");
      file << "Valve state data\n";
      file << "a,b,c,\n";
      file.close();
      return 0;
}

//Return time NOW
uint8_t _calibration::pushTime(){
    //Seconds
    time_t now = time(nullptr);
    //Milliseconds
    time_t mnow = now * 1000;
    return mnow;
}

uint8_t  _calibration::start_calibration(){
    uint8_t temp_data_store[400];
    //Run valve cycle for 360 degrees
    for(uint8_t i = 0; i < 360; i++){
        valveCycle(i);
        //delay
        calibStepsTaken += 1;
        auto current_time = pushTime();
        //Store valve pos + time
        databufferArray[calibStepsTaken][0] = calibStepsTaken;
        databufferArray[calibStepsTaken][1] = current_time;
    }
    outputToCSV();
    return 0;
}