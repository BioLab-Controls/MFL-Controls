#ifndef MODULEINPUT
#define MODULEINPUT

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

#define FILE "testdata.csv"

class _moduleInput {
    public:
        std::string Values_raw;
        std::string pressureD;
        std::string flowD;

    public:
        //Constructor 
        _moduleInput();

        void readFile();

        double getFlowData();

        double getPressureData();

    private:
        double convert_to_double(std::string data);

        std::string sortData(std::string data);

};

#endif 