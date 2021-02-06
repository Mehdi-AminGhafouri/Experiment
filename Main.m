N = 10; %Generate 10 data sample
data = DataGenerator(N);


fuzzy_data = FuzzyFire(data , N);


fuzzy_answer = FuzzyEngion(fuzzy_data , N);


[ certain_answer , plot_data ] = DeFuzzyFire(fuzzy_answer , N);



%plot output data
bar(1:N,plot_data);
title('Fuzzy System');
xlabel('Sample Data')
ylabel('Speed Result    VeryLow=1, Low=2, Mid=3, High=4, VeryHigh=5')