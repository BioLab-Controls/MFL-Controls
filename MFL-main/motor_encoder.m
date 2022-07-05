% Sub routine to allow the valve firmware process to keep track of the
% current position of the requested motor

classdef motor_encoder
    properties
        CALIBRATE = 0;
        INCREMENT = 1;
        %Valve Task - Index 0,
        %Valve current step - Index 1
        valveMap = [];
    end
    
    methods
        function pos = encoderReturnPosition(task,valveID,newSteps)
            if task == CALIBRATE
                %calibrate to ZERO
                calibrateToZero(valveID);
            end 

            if task == INCREMENT
                %increment
                stepUpdate = modifyValveIDStepData(valveID,newSteps);
                %Return
                pos = stepUpdate;
            end

            if task ~= CALIBRATE || task ~= INCREMENT
               error("Invalid task for motor encoder");
            end

        end

        function vSteps = retrieveValveIDStepData(valveID)
            %Search for valve ID and get data in next index
            valveIndex = find(valveMap == valveID,1);
            %Return data
            vSteps = valveMap(valveIndex + 1);
        end

        function upD = modifyValveIDStepData(valveID, steps)
            currentStep = retrieveValveIDStepData(valveID);
            %Get index
            valveIndex = find(valveMap == valveID,1);
            %Modify
            valveMap(valveIndex + 1) = (currentStep + steps);
            %Return 
            upD = (currentStep + steps);
        end

        function calibrateToZero(valveID)
            %Get index
            valveIndex = find(valveMap == valveID,1);
            %Set to 0
            valveMap(valveIndex + 1) = 0;
        end
    end
end