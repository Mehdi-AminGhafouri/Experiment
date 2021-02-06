function [ output , plot_data ] = DeFuzzyFire( data , N )
output = char(N,20);
plot_data = zeros(1,N);

for k=1:N
    
        switch data(k,:)
            case 'VL'
                output(k,1:20) = 'speed  is  very  low';
                plot_data(1,k) = 1;
            case 'Lo'
                output(k,1:20) =  'speed     is     low';
                plot_data(1,k) = 2;
            case 'Mi'
                output(k,1:20) =  'speed   is    normal';
                plot_data(1,k) = 3;
            case 'Hi'
                output(k,1:20) =  'speed    is     high';
                plot_data(1,k) = 4;
            case 'VH'
                output(k,1:20) =  'speed  is  very high';
                plot_data(1,k) = 5;
        end
    
end


end

