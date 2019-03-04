function extrabeep(numberOfBeeps)

x = 0;
beep on;
while x <= numberOfBeeps
    beep;
    x = x+1;
    pause(0.1)
end