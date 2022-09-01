function cal = calibrationMFL()
    
    openPos = 0;
    
    for i = 1:length(valves)
        angularAdjustment(valves(i),valvePos(i),openPos);
    end
    
end