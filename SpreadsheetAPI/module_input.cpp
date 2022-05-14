#include"module_input.h"

std::string Values;

 //Constructor 
_moduleInput::_moduleInput(){
    readFile();
}

double _moduleInput::convert_to_double(std::string data){

}

void _moduleInput::readFile(){
    fstream file (FILE, ios::in);
    if(file.is_open()){
        file.seekg(-1,ios_base::end);                // go to one spot before the EOF

        bool keepLooping = true;
        while(keepLooping) {
            char ch;
            file.get(ch);                            // Get current byte's data

            if((int)file.tellg() <= 1) {             // If the data was at or before the 0th byte
                file.seekg(0);                       // The first line is the last line
                keepLooping = false;                // So stop there
            }
            else if(ch == '\n') {                   // If the data was a newline
                keepLooping = false;                // Stop at the current position.
            }
            else {                                  // If the data was neither a newline nor at the 0 byte
                file.seekg(-2,ios_base::cur);        // Move to the front of that data, then to the front of the data before it
            }
        }

        std::string lastLine;            
        Values = getline(file,lastLine);                      // Read the current line
        file.close();

    }
}

double _moduleInput::getFlowData(){
    return 0;
}

double _moduleInput::getPressureData(){
    
}