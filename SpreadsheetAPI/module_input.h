#ifndef MODULEINPUT
#define MODULEINPUT

#include <iostream>
#include <fstream>
#include <sstream>

#define FILE "testdata.csv"

class _moduleInput {
    public:
        //Constructor 
        _moduleInput();

        void readFile();

    public:
        double getFlowData();

        double getPressureData();

    private:
        double convert_to_double(std::string data);

};

#endif 