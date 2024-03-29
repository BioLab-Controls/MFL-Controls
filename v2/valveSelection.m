function active = valveSelection()
    
    valves = [13,14,15,16,17,18,19,20]; % pins
    valvePos = [45,60,70,180,90,20,30,270]; % angle
    flowData = [40,60,40,60,40,60,40,60]; % flow reading
    table = readmatrix("exampleLookup.xlsx");

    for i = 1:length(flowData)
        for j = 1:height(table)    
            if flowData(i) == table(j,2)
                fprintf('%i\n',table(j,1));
                setPos = table(j,1);
            else
            end
        end
    end

    for k = 1:length(valvePos)
        if valvePos < setPos
            fprintf('Increasing...')
            valvePos(k) = valvePos(k) + 5;
        elseif valvePos > setPos
            fprintf('Decreasing...')
            valvePos(k) = valvePos(k) - 5;
        end
    end
   
end