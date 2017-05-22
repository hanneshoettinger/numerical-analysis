%%
%b)
k = [1;2;3];
k = (1/norm(k))*k; % normalize vector
x = [1;0;1];
K = [0 -k(3) k(2);k(3) 0 -k(1);-k(2) k(1) 0];

phi = pi/4;

% with matrix vector product, and the matrix K
R1 = (eye(3) + sin(phi).*K + (1-cos(phi)).*(k*k'-eye(3)))*x
% only with vector calculations, NOT using the matrix K
R2 = x + sin(phi).*(cross(k,x))+k.*(k'*x)*(1-cos(phi)) - x + x.*cos(phi)


%c)
R1 = (eye(3) + sin(phi).*K + (1-cos(phi)).*(k*k'-eye(3)))*k

R2 = k 

%d) es gilt x normal auf k

k = [1;2;3];
n = 3;
x1 = 5; x2 = k(3) * n + x1; x3 = -k(2) * n - x1;
x = [x1;x2;x3]; % x normal to k

k = (1/norm(k))*k; % normalize vector
K = [0 -k(3) k(2);k(3) 0 -k(1);-k(2) k(1) 0];

% with matrix vector product, and the matrix K
R1 = (eye(3) + sin(phi).*K + (1-cos(phi)).*(k*k'-eye(3)))*x
% only with vector calculations, NOT using the matrix K 
% -> only when x normal to k
R2 = sin(phi)*(cross(k,x)) + x .* cos(phi)



















