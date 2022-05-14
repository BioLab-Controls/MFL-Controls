#ifndef MODULEINPUT
#define MODULEINPUT

#include<fstream>

#define FILE outputdata

class _moduleInput {
    private:
        double convert_to_double(string data);

        double readFile();

    public:
        double getFlowData();

        double getPressureData();


};

#endif 