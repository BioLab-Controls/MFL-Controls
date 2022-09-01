function shaftAngle = angularAdjustment(valve,startAngle,setPos)

    if startAngle < setPos
        writeDigitalPin(pi, 13, 1) % clockwise
        writePWMDutyCycle(pi, valve, 0.5);
        writePWMFrequency(pi, valve, 1000);
    elseif startAngle > setPos
        writeDigitalPin(pi, 13, 0) % counter-clockwise
        writePWMDutyCycle(pi, valve, 0.5);
        writePWMFrequency(pi, valve, 1000);
    end
    
end


