returnCurrentStep(2)
updateEncoderPosition(2,10)
returnCurrentStep(2)

function current = returnCurrentStep(valveID)
    INCREMENT = 1;
    %Get current step position as position from calibrated ZERO
    currentStepPosition = motor_encoder(INCREMENT,valveID,0);
    current = currentStepPosition;
end

function updateEncoderPosition(valveID,pos)
    INCREMENT = 1;
    motor_encoder(INCREMENT,valveID,pos);
end