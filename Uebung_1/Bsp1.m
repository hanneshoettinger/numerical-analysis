%% Bsp 1b/1c Trapez *******************************************************
format long
for n = 0:10
    % set interval
    X = [0 2^(-n)];
    % trapezoidal rule
    A_T = ((X(2) - X(1))/2) * (sin(X(1)) + sin(X(2)));
    
    % create function and calculate integral
    fun = @(x) sin(x);
    q = integral(fun,X(1),X(2));
    
    % approx error
    Error_T(n+1,1) = abs(A_T - q);
end

for n = 1:10
   Error_T(n,2) = Error_T(n+1,1) / Error_T(n,1);
end

%% Bsp 1d
X = [0 1];
A_T = zeros(100,1);
for n= 0:10
    % intervall size
    inter = 2^(-n);
    % loop over intervall and sum using trapz
    for nn=inter:inter:1
        T = [nn-inter nn];
        A_T(n+1) = A_T(n+1) + ((T(2) - T(1))/2) * (sin(T(1)) + sin(T(2)));
    end
    % create function and calc integral
    fun = @(x) sin(x);
    q = integral(fun,X(1),X(2));
    
    % approx error
    Error_TF(n+1,1) = abs(A_T(n+1) - q);
end
for n = 1:10
   Error_TF(n,2) = Error_TF(n+1,1) / Error_TF(n,1);
end

%% Simpson Formel. Bsp 1e *************************************************
for n = 0:10
    X = [0 2^(-n)];
    
    A_S = ((X(2) - X(1))) * ((1/6)*sin(X(1)) + (4/6)*sin((X(1)+X(2))/2) + (1/6)*sin(X(2)));
    
    fun = @(x) sin(x);
    q = integral(fun,X(1),X(2));
    
    Error_S(n+1,1) = abs(A_S - q);
end
for n = 1:10
   Error_S(n,2) = Error_S(n+1,1) / Error_S(n,1);
end

%%
X = [0 1];
A_S = zeros(100,1);
for n= 0:10
    % intervall size
    inter = 2^(-n);
    % loop over intervall and sum using trapz
    for nn=inter:inter:1
        T = [nn-inter nn];
        A_S(n+1) = A_S(n+1) + ((T(2) - T(1))) * ((1/6)*sin(T(1)) + (4/6)*sin((T(1)+T(2))/2) + (1/6)*sin(T(2)));
    end
    % create function and calc integral
    fun = @(x) sin(x);
    q = integral(fun,X(1),X(2));
    
    % approx error
    Error_SF(n+1,1) = abs(A_S(n+1) - q);
end
for n = 1:10
   Error_SF(n,2) = Error_SF(n+1,1) / Error_SF(n,1);
end



