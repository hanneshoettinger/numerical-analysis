%%  UE2
%   Bsp 8
%   a)

%   f(y) = tan(y) - x;

%   f'(y) = 1+tan^2(y);

index = 1;
sigma = 10^-14;

for x = 0:0.1:1

    yi = x;
    delta = 1;
    iterationCount = 0;
    
    while delta >= sigma
      yi1 = yi - (tan(yi) - x) / (1 + tan(yi)^2);
      delta = abs(yi1 - yi);
      yi = yi1;
      iterationCount = iterationCount +1;
    end
    
    OutputA(index,1) = x;                   % x-Wert
    OutputA(index,2) = yi;                  %approximierter Wert
    OutputA(index,3) = iterationCount;      %Anzahl der Iterationen
    OutputA(index,4) = atan(x);             %Tatsächlicher Wert
    index = index + 1;
end

index = 1;

%   b)
for x = 1:1:20
    
    yi = (1/x);
    delta = 1;
    iterationCountPre = 0;
    
    while delta >= sigma
      yi1 = yi - (tan(yi) - (1/x)) / (1 + tan(yi)^2);
      delta = abs(yi1 - yi);
      yi = yi1;
      iterationCountPre = iterationCountPre +1;
    end
    
    yi = pi/2 - yi;
    delta = 1;
    iterationCount = 0;
    
    while delta >= sigma
      yi1 = yi - (tan(yi) - x) / (1 + tan(yi)^2);
      delta = abs(yi1 - yi);
      yi = yi1;
      iterationCount = iterationCount +1;
    end
    
    OutputB(index,1) = x;                  
    OutputB(index,2) = yi;
    OutputB(index,3) = iterationCountPre;
    OutputB(index,4) = iterationCount;
    OutputB(index,5) = atan(x);
    index = index + 1;
end

index = 1;

%   c)
for x = 0:-1:-20
    
    x = x * -1;
    yi = 0;
    iterationCountPre = 0;
    iterationCount = 0;
    
    if x > 1
        yi = (1/x);
        delta = 1;

        while delta >= sigma
          yi1 = yi - (tan(yi) - (1/x)) / (1 + tan(yi)^2);
          delta = abs(yi1 - yi);
          yi = yi1;
          iterationCountPre = iterationCountPre +1;
        end
        yi = pi/2 - yi;
    else
        yi = x;
    end

    delta = 1;
    
    while delta >= sigma
      yi1 = yi - (tan(yi) - x) / (1 + tan(yi)^2);
      delta = abs(yi1 - yi);
      yi = yi1;
      iterationCount = iterationCount +1;
    end
    
    OutputC(index,1) = x;                  
    OutputC(index,2) = -yi;
    OutputC(index,3) = iterationCountPre;
    OutputC(index,4) = iterationCount;
    OutputC(index,5) = atan(-x);
    index = index + 1;
end
