function[v2] = SledAnalyticSolution(t, v)

v2 = zeros(1,length(t));

    for i = 1:length(t)
        v2(i) = v*exp((-500*t(i)./1000));
    end
end
