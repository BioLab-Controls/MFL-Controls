import os
import csv
import random as r2
import time


def pushToSpreadsheet(valve,data):
    #Separate buffer
    fdata = str(data[0])
    pdata = str(data[1])
    print(fdata)
    print(pdata)
    #Get file
    files = ["dataValue-1.csv"]
    #Open and write
    with open(files[valve - 1], 'a', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerows(zip(fdata,pdata))
        
def generateRandom():
    #Random flow
    flow = r2.randint(1,25)
    print(flow)
    #Random Pressure
    pres = r2.randint(1,10)
    dataCompiled = [flow,pres]
    return dataCompiled

while True:
    dataArray = generateRandom()
    pushToSpreadsheet(1,dataArray)