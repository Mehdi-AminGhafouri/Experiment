function [ data ] = DataGenerator( N )

%data(1,:) = N ta Pressure value;  (range => [0 : 200])
%data(2,:) = N ta Tempeture value; (range => [0 : 100])

data = [(rand(1,N).*300);(rand(1,N).*100)];

end

