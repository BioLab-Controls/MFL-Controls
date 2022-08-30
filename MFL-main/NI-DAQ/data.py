import os
import csv

def pushToSpreadsheet(valve,data):
    #Separate buffer
    fdata = str(data[0])
    pdata = str(data[1])
    print(fdata)
    print(pdata)
    #Get file
    files = ["dataValve-1.csv"]
    #Open and write
    with open(files[valve - 1], 'w', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerows(zip(fdata,pdata))
        

dataArray = [3,4]
pushToSpreadsheet(1,dataArray)