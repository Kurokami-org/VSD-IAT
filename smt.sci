clc;
clear all;


stuffed_data = [1 1 1 1 1 0 1 0 0 1 1 1 1 1 0];


destuffed_data = [];
ones_counter = 0;

for i = 1:length(stuffed_data)
    
    current_bit = stuffed_data(i);
    
    if (current_bit == 1)
        destuffed_data = [destuffed_data, current_bit];
        ones_counter = ones_counter + 1;
    else 
        
        if (ones_counter == 5)

            ones_counter = 0;
        else

            destuffed_data = [destuffed_data, current_bit];
            ones_counter = 0; 
        end
    end
end


disp('Stuffed Data:');
disp(stuffed_data);

disp('Destuffed:');
disp(destuffed_data);
