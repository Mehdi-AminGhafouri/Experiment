function [ output ] = FuzzyEngion( data , N )
output = char(N,2);

for k=1:N
    value = RuleBase(data(k,:));
    switch value
        case 'VL'
            output(k,1) = 'V';
            output(k,2) = 'L';
        case 'Lo'
            output(k,1) = 'L';
            output(k,2) = 'o';
        case 'Mi'
            output(k,1) = 'M';
            output(k,2) = 'i';

        case 'Hi'
            output(k,1) = 'H';
            output(k,2) = 'i';
        case 'VH'
            output(k,1) = 'V';
            output(k,2) = 'H';
    end
end

