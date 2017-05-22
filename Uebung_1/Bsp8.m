%% Bsp a)


A = [2 3 0 0 0;...
     0 2 6 0 0;...
     0 0 6 4 0;...
     0 0 0 8 1;...
     0 0 0 0 3];
     
res = [4; 2; 5; 3; 1];

testresult = A\res;

% gaussian elimination
for n=length(A):-1:1
    % last value in matrix -> solve directly
    if n == length(A)
        A(n,n) = res(n)/A(n,n);
    % solve for next variable and eliminate 
    else 
        A(n,n) = (res(n) - A(n+1,n+1)*A(n,n+1))/A(n,n);
        A(n,n+1) = 0;
    end
end
    

%% Bsp b)

A = [2 3 0 0 0;...
     2 2 6 0 0;...
     0 4 6 4 0;...
     0 0 4 8 1;...
     0 0 0 4 3];
     
res = [4; 2; 5; 3; 1];

testresult = A\res;

% change matrix to format of Bsp a)
for n=1:length(A)
    if n < length(A)
        dfaktor = (A(n+1,n)/A(n,n))*-1;
        A(n+1,:) = A(n+1,:) + A(n,:).*dfaktor;
        res(n+1,:) = res(n+1,:) + res(n,:).*dfaktor;
    end
end

% resolve
for n=length(A):-1:1
    if n == length(A)
        A(n,n) = res(n)/A(n,n);
    else 
        A(n,n) = (res(n) - A(n+1,n+1)*A(n,n+1))/A(n,n);
        A(n,n+1) = 0;
    end
end

%% Bsp c)

A = [2 3 0 0 0;...
     2 2 6 0 0;...
     0 4 6 4 0;...
     0 0 4 8 1;...
     0 0 0 4 3];
 
B = A;
 
X = eye(5);
 
% change matrix to format of Bsp a) and write changes into identity
for n=1:length(A)
    if n < length(A)
        dfaktor = (A(n+1,n)/A(n,n))*-1;
        A(n+1,:) = A(n+1,:) + A(n,:).*dfaktor;
        X(n+1,:) = X(n+1,:) + X(n,:).*dfaktor;
    end
end

% resolve and write changes into identity
for n=length(A):-1:1
    if n > 1
        dfaktor = (A(n-1,n)/A(n,n))*-1;
        A(n-1,:) = A(n-1,:) + A(n,:).*dfaktor;
        X(n-1,:) = X(n-1,:) + X(n,:).*dfaktor;
    end
end

% resolve A to identity and write factor to X
for n=1:length(A)
   X(n,:) = X(n,:)./A(n,n);
   A(n,:) = A(n,:)./A(n,n);
end

 
 

















 











