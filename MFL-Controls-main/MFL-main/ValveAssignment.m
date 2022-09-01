function result = ValveAssignment(flowData, pressureData)
    %Load in calibration data
    flowdataCalib = retrieveCalibrationData_F();
    PressuredataCalib = retrieveCalibrationData_P();
    %Assign position for flow calibration curve
    result = assignPosition(flowData,flowdataCalib);
    %Assign position for position curve
    assignPosition(pressureData,PressuredataCalib);
    %Use both the flow position and pressure position to check if
    %position is within 5% diff off each other, if so use average else
    %use flow
    

end

function newPS = assignPosition(newValue,referenceData)
    valvePos = referenceData(:,2);
    primaryData = referenceData(:,1);
    %Linear search for new value in reference data 
    %Within 1%
    indX  = 0;
    for i = 1:length(primaryData)
        allowable_diff = 0.05 * primaryData(i); %Percent
        if newValue > (primaryData(i) - allowable_diff) && newValue < (primaryData(i) + allowable_diff)
            %Update index of reference data value
            indX = i;
            break;
        else
            %Do nothing and continue
        end 
    end
    
    %Get data in next column referencing Valve Position using index
    newPS = valvePos(indX);
    
end

function dataF = retrieveCalibrationData_F()
    calibration_file_F = 'MFL_Flow_Calibration.xlsx';
    full_path = strcat('mfldir/',calibration_file_F);
    data = [];
    if(exist(full_path) ~= 0)
        data = xlsread(full_path);
    else
        error(strcat('Cannot Read -',calibration_file_F));
    end
    dataF = data;
end

function dataP = retrieveCalibrationData_P()
    calibration_file_P = 'MFL_Pressure_Calibration.xlsx';
    full_path = strcat('mfldir/',calibration_file_P);
    data = [];
    if(exist(full_path) ~= 0)
        data = xlsread(full_path);
    else
        error(strcat('Cannot Read -',calibration_file_P));
    end
    dataP = data;
end
