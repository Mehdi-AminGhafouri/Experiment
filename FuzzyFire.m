function [ output ] = FuzzyFire( data , N )
% output 2*N
output = char(N,2);

%data(1,:) = N ta Pressure value;  (range => [0 : 200])
%data(2,:) = N ta Tempeture value; (range => [0 : 100])

%Pressure LOW  { x | 0 <= x <= 100 }
%Pressure Mid  { x | 100 < x < 200 }
%Pressure High { x | 200 <= x <= 300 }

%Tempeture LOW  { x | 0 <= x <= 30 }
%Tempeture Mid  { x | 30 < x < 60 }
%Tempeture High { x | 60 <= x <= 100 }


%%
for k=1:N
    if data(1,k) <=100
        output(k,1) = 'L';
    elseif data(1,k) <200
        output(k,1) = 'M';
    elseif data(1,k) <=300
        output(k,1) = 'H';
    end
    
    if data(2,k) <=30
        output(k,2) = 'L';
    elseif data(2,k) <60
        output(k,2) = 'M';
    elseif data(2,k) <=100
        output(k,2) = 'H';
    end
end

        


end

