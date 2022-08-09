from random import random
import time
#import nidaqmx
#from nidaqmx.constants import(LineGrouping)
#from numpy import promote_types
import csv

value = 0

def main():
    no_of_valves = 6
    FLOW = 0
    PRESSURE = 1
    #Loop through all flow and pressure sensors for valves 1 - 6 and update to xlsx files
    for i in range(no_of_valves):
        #Get flow data
        port = assignValveToPort(FLOW,i)
        flowVal = temp(port2) #RetrieveData(port)
        #Get pressure data
        port2 = assignValveToPort(PRESSURE,i)
        pressureVal = temp(port2) #RetrieveData(port2)
        #Push to spreadsheet
        dataPoints = [flowVal,pressureVal]
        print(dataPoints)
        pushToSpreadsheet(i,dataPoints)


#def dataCollectAtPort(port):
#    task = nidaqmx.Task()
#    task.di_channels.add_di_chan(port)
#    task.start()
#    #Read and update 
#    value = task.read()

#    task.stop
#    task.close()
    

def RetrieveData(port):
    #data read from port updated to global variable
    dataCollectAtPort(port)
    #Get value and return to calling func
    return value

def temp(port):
    return random.randrange(10)

def assignValveToPort(type,valve):
    #Pin assignment
    #1 - 13
    #2 - 14
    #etc
    #Get flow data for the valve
    if type == 0:
        valves_Ports_FLOW = ["Dev1/port1/line1","Dev1/port1/line2"]; # pins
        return valves_Ports_FLOW(valve - 1)

    #Get pressure data for the valve
    if type == 1:
        valves_Ports_PRESSURE = ["Dev1/port2/line1","Dev1/port2/line2"]; # pins
        return valves_Ports_PRESSURE(valve - 1)

    #Return 0 if conditional fails
    return 0

def pushToSpreadsheet(valve,data):
    #Separate buffer
    fdata = data[0]
    pdata = data[1]
    print(fdata)
    print(pdata)
    #Get file
    files = ["dataValve-1.csv","dataValve-2.csv","dataValve-3.csv","dataValve-4.csv","dataValve-5.csv","dataValve-6.csv"]
    #Open and write
    with open(files[valve - 1], 'w', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(fdata)
        writer.writerow(pdata)