task = 1;
valveID = 5;
increment_steps = 2;
x = 0;
valvePosition = 255;

instruction_set = [1,90];

IS_Parser(instruction_set);

% stpsT = HLVP_converter(valveID,valvePosition);

object = motor_encoder(task,valveID,increment_steps);

% fprintf(object);
