function [] = TrialRandomData(L)
for i=1:100
    x = 18*rand(1,3);
    B = testData(L,x);
    a=getPMF(B);
    [value, ind] = max(a(1,:));
    class = a(2, ind);
    hold on;
    switch (class)
        case 1
            plot3(x(1), x(2), x(3), 'dr');
        case 2
            plot3(x(1), x(2), x(3), 'dk');
        case 3
            plot3(x(1), x(2), x(3), 'db');
        case 4
            plot3(x(1), x(2), x(3), 'dc');
        case 5
            plot3(x(1), x(2), x(3), 'dm');
    end
end
