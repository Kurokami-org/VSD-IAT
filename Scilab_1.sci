clc;
clear all;

data = [1 1 1 1 1 1 0 0 1 1 1 1 1];
stuffed_data = []; 
counter = 0;


for x = 1 : length(data)
    

    stuffed_data = [stuffed_data, data(x)];
    
 
    if (data(x) == 1)
        counter = counter + 1;
    else
        counter = 0; 
    end
    
    
    if (counter == 5)
        stuffed_data = [stuffed_data, 0];
        counter = 0; 
    end
end


disp('Original Data:');
disp(data);

disp('Stuffed Data:');
disp(stuffed_data);
