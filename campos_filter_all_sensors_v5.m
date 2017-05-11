prompt = 'enter sensor file name: ';
data = csvread(input(prompt, 's'));

tic

sampling_period = (data(10,38)-data(9,38))/1000;

% =================================================================================================

all_probes = zeros(36,2);
for i = 1:36
    all_probes(i,1) = i;
end

all_probe_time_secs = zeros(36,2);
for i = 1:36
    all_probe_time_secs(i,1) = i;
end

filtered_data = zeros(length(data),36);
normalized_data = zeros(length(data),36);
stepped_data = zeros(length(data),36);

maximums = zeros(36,2);
for i = 1:36
   maximums(i,1) = i;
end

frame_indexes = zeros(length(data),1);
for i = 1:length(data)
    frame_indexes(i) = i;
end

% =================================================================================================
% Large loop begins here

for current_sensor = 1:36
    
    active_sensor = data(:,current_sensor);
    
    [b_active a_active] = butter(5,0.15,'low');
    filtered_active_sensor = filtfilt(b_active,a_active,active_sensor);
    filtered_data(:,current_sensor) = filtered_active_sensor;
    normalized_active_sensor = active_sensor-filtered_active_sensor;
    normalized_data(:,current_sensor) = normalized_active_sensor;
    max_active_sensor = max(normalized_active_sensor);
    stepped_active_sensor = normalized_active_sensor;
    

    for k = 1:length(active_sensor) % 1
        if current_sensor == 14 
            if stepped_active_sensor(k) >= -4 && stepped_active_sensor(k) <= 4
                stepped_active_sensor(k) = 0;
            end
        elseif stepped_active_sensor(k) >= -20 && stepped_active_sensor(k) <= 20
            stepped_active_sensor(k) = 0;
        end
    end
    
    for k = 1:length(active_sensor) % 2
        if stepped_active_sensor(k) < 0
            stepped_active_sensor(k) = max_active_sensor;
        end
    end     
    
    for k = 2:length(active_sensor)-1 % 3
        if stepped_active_sensor(k) < stepped_active_sensor(k-1) && stepped_active_sensor(k) < stepped_active_sensor(k+1) && (((stepped_active_sensor(k-1)-stepped_active_sensor(k)) + (stepped_active_sensor(k+1)-stepped_active_sensor(k)))) > 10
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    for k = 2:length(active_sensor)-1 % 4
        if stepped_active_sensor(k) > 10 && stepped_active_sensor(k) < stepped_active_sensor(k-1) && stepped_active_sensor(k) < stepped_active_sensor(k+1)
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    for k = 2:length(active_sensor)-1 % 5
        if stepped_active_sensor(k) > 10 && stepped_active_sensor(k) < stepped_active_sensor(k-1) && stepped_active_sensor(k) < stepped_active_sensor(k+1)
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    for k = 2:length(active_sensor)-1 % 6
        if stepped_active_sensor(k) > 10 && stepped_active_sensor(k) < stepped_active_sensor(k-1) && stepped_active_sensor(k) < stepped_active_sensor(k+1)
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    for k = 2:length(active_sensor)-1 % 7
        if stepped_active_sensor(k) > 10 && stepped_active_sensor(k) < stepped_active_sensor(k-1) && stepped_active_sensor(k) < stepped_active_sensor(k+1)
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    for k = 1:length(active_sensor) % 8
        if stepped_active_sensor(k) > 0
            stepped_active_sensor(k) = max_active_sensor;      
        end
    end
    
    % ============================================================
    % elevate runs of "low" that are below a threshold length
    
    
    for k = 1:length(active_sensor) - 22 % 13
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) <= 0 && stepped_active_sensor(k+18) <= 0 && stepped_active_sensor(k+19) <= 0 && stepped_active_sensor(k+20) <= 0 && stepped_active_sensor(k+21) <= 0 && stepped_active_sensor(k+22) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
            stepped_active_sensor(k+17) = max_active_sensor;
            stepped_active_sensor(k+18) = max_active_sensor;
            stepped_active_sensor(k+19) = max_active_sensor;
            stepped_active_sensor(k+20) = max_active_sensor;
            stepped_active_sensor(k+21) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 21 % 14
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) <= 0 && stepped_active_sensor(k+18) <= 0 && stepped_active_sensor(k+19) <= 0 && stepped_active_sensor(k+20) <= 0 && stepped_active_sensor(k+21) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
            stepped_active_sensor(k+17) = max_active_sensor;
            stepped_active_sensor(k+18) = max_active_sensor;
            stepped_active_sensor(k+19) = max_active_sensor;
            stepped_active_sensor(k+20) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 20 % 15
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) <= 0 && stepped_active_sensor(k+18) <= 0 && stepped_active_sensor(k+19) <= 0 && stepped_active_sensor(k+20) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
            stepped_active_sensor(k+17) = max_active_sensor;
            stepped_active_sensor(k+18) = max_active_sensor;
            stepped_active_sensor(k+19) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 19 % 16
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) <= 0 && stepped_active_sensor(k+18) <= 0 && stepped_active_sensor(k+19) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
            stepped_active_sensor(k+17) = max_active_sensor;
            stepped_active_sensor(k+18) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 18 % 17
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) <= 0 && stepped_active_sensor(k+18) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
            stepped_active_sensor(k+17) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 17 % 18
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) <= 0 && stepped_active_sensor(k+17) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
            stepped_active_sensor(k+16) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 16 % 19
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) <= 0 && stepped_active_sensor(k+16) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
            stepped_active_sensor(k+15) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 15 % 20
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) <= 0 && stepped_active_sensor(k+15) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
            stepped_active_sensor(k+14) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 14 %21
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) <= 0 && stepped_active_sensor(k+14) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
            stepped_active_sensor(k+13) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 13 %22
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) <= 0 && stepped_active_sensor(k+13) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
            stepped_active_sensor(k+12) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 12 %23
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) <= 0 && stepped_active_sensor(k+12) == max_active_sensor 
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
            stepped_active_sensor(k+11) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 11 %24
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) <= 0 && stepped_active_sensor(k+11) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
            stepped_active_sensor(k+10) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 10 % 25
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) <= 0 && stepped_active_sensor(k+10) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
            stepped_active_sensor(k+9) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 9 % 26
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) <= 0 && stepped_active_sensor(k+9) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
            stepped_active_sensor(k+8) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 8 % 27
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) <= 0 && stepped_active_sensor(k+8) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
            stepped_active_sensor(k+7) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 7 % 28
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) <= 0 && stepped_active_sensor(k+7) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
            stepped_active_sensor(k+6) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 6 % 29
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) <= 0 && stepped_active_sensor(k+6) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
            stepped_active_sensor(k+5) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 5 % 30
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) <= 0 && stepped_active_sensor(k+5) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
            stepped_active_sensor(k+4) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 4 % 31
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) <= 0 && stepped_active_sensor(k+4) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
            stepped_active_sensor(k+3) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 3 % 32
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) <= 0 && stepped_active_sensor(k+3) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
            stepped_active_sensor(k+2) = max_active_sensor;
        end
    end
    
    for k = 1:length(active_sensor) - 2 % 33
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k+1) <= 0 && stepped_active_sensor(k+2) == max_active_sensor
            stepped_active_sensor(k+1) = max_active_sensor;
        end
    end
    
    % ==========
    % Now take sensor 14 and apply a specially customized threshold pattern
    
    
    % End sensor 14 custom threshold pattern
    % ==================================
    
    % count the number of individual probing events
    num_probes_35 = 0;
    for k = 2:length(active_sensor)
        if stepped_active_sensor(k) == max_active_sensor && stepped_active_sensor(k-1) < max_active_sensor
            num_probes_35 = num_probes_35+1;
        end
    end
    
    % ===========================
    % total time spent probing
    tot_probing_time_35 = 0;
    for k = 1:length(active_sensor)
        if stepped_active_sensor(k) == max_active_sensor 
            tot_probing_time_35 = tot_probing_time_35+1;
        end
    end
    
    
    tot_probing_time_secs_35 = tot_probing_time_35 * sampling_period;
    if num_probes_35 == 0
        tot_probing_time_secs_35 = 0;
    end
    % ===========================
    
    
    all_probes(current_sensor,2) = num_probes_35;
    all_probe_time_secs(current_sensor,2) = tot_probing_time_secs_35;
    stepped_data(:,current_sensor) = stepped_active_sensor; 
    maximums(current_sensor,2) = max_active_sensor;
    
    
    
    figure(current_sensor), plot(frame_indexes,data(:,current_sensor))
    %figure(current_sensor + 1000), plot(frame_indexes,normalized_data(:,current_sensor))
    figure(current_sensor + 100), plot(frame_indexes,stepped_data(:,current_sensor))
    
end    
% /////////////////////////////////////////////////////////////////////////////////////////////////
% figure(1114), plot(frame_indexes,normalized_data(:,14))
toc