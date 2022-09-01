function ret = data(ValveID)
    mostRecentDataPoints = [];
    %Get path name
    pathName = assignValveToPath(ValveID);
    %Get initial data
    [init_data_flow,init_data_pressure] = returnFromSpreadsheet(pathName);
    %Parse to get most recent value
    %Append to most recent data points
    [mostRecentDataPoints(1),mostRecentDataPoints(2)] = getMostRecentData(init_data_flow,init_data_pressure);
  
    ret = mostRecentDataPoints;
end

function [spSheet1,spSheet2] = returnFromSpreadsheet(path)
    spreadsheetData = readmatrix(path);
    %Flow data
    temp = spreadsheetData(:,1);
    flow_data = reshape(temp.',1,[]);
    %Pressure
    temp2 = spreadsheetData(:,2);
    pressure_data = reshape(temp2.',1,[]);
    spSheet1 = flow_data;
    spSheet2 = pressure_data;
end

function path = assignValveToPath(ValveID)
    master_dir = "mfldir/";
    dataPaths = ["1","dataValue-1.csv","2","dataValue-2.csv","3","dataValue-3.csv","4","dataValue-4.csv","5","MFL-5.txt","6","MFL-6.txt"];
    index = find(dataPaths == string(ValveID),1);
    path = strcat(master_dir,dataPaths(index + 1));
end

function [val1,val2] = getMostRecentData(allDataFlow,allDataPessure)
    %Parse to get most recent value
    val1 = allDataFlow(length(allDataFlow));
    val2 = allDataPessure(length(allDataPessure));
end