
% connect the board
s1 = arduino('COM3');
s1.pinMode(2,'input');
s1.pinMode(9,'output');
s1.pinMode(10,'output');

s1.digitalWrite(9,1);

% attach servo #1
s1.servoAttach(9);

global b;
b=0;
% move servo #1 to 5 degrees position
while(1)
    if s1.digitalRead(2)==0
        s1.servoWrite(9,120);
        val2 = s1.servoRead(9);
        s1.digitalWrite(10,1);
        pause(.3)
        
    elseif s1.digitalRead(2)==1
        s1.servoWrite(9,0);
        s1.digitalWrite(10,0);
        val1 = s1.servoRead(9);
        
        pause(.3)
    end
    
    
    
    
end

% attach servo #1
s1.servoDetach(9);


