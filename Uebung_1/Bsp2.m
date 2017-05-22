
%% Bsp2 a) 
format long
x = 0.1;
phi = 0:x:2*pi;

% diff of cos(phi) and sin(phi)
dx1 = -(sin(phi));
dy1 = (cos(phi));

fax = sqrt(dx1.^2 + dy1.^2);

% setup for integration
n=numel(fax)-1; h=2*pi/n;
% trapz
len_t = h*(fax(1)/2 + sum(fax(2:1:end-1))+ fax(end)/2)
% simpson
len_s = (h/3)*(fax(1)+2*sum(fax(3:2:end-2))+4*sum(fax(2:2:end))+fax(end))

diff_t = abs(2*pi - len_t)
diff_s = abs(2*pi - len_s)

%% Bsp 2b) ****************************************************************
phi = 0:0.01:2*pi;
format long
% diff of function
dx1 = cos(phi) - phi.*sin(phi);
dy1 = sin(phi) + phi.*cos(phi);
dz1 = cos(phi).*cos(phi) - sin(phi).*sin(phi);

fax = sqrt(dx1.^2 + dy1.^2 + dz1.^2);

n=numel(fax)-1; h=(2*pi)/n;
% trapz
len_t = (h)*(fax(1)/2 + sum(fax(2:1:end-1))+ fax(end)/2)
% simpson
len_s = (h/3)*(fax(1)+2*sum(fax(3:2:end-2))+4*sum(fax(2:2:end))+fax(end))

norm = 21.85437391650173758897;
diff_t = abs(norm - len_t)
diff_s = abs(norm - len_s)


%% trapz
norm = 21.85437391650173758897;

phi = 0:0.1:2*pi;
%plot3(FX.*phi,FY.*phi,FX.*FY)

x=0.08;
for i=0:20
    phi = 0:x:2*pi;
    % setup function
    fax=sqrt((sin(phi) + phi.*cos(phi)).^2 + (cos(phi) - phi.*sin(phi)).^2 + ...
        (cos(phi) .* cos(phi) - sin(phi) .* sin(phi)).^2);
    
    n=numel(fax)-1; h=(2*pi)/n;
    % trapz
    len_t= h/2*(fax(1)+2*sum(fax(2:1:end-1))+fax(end));
    
    diff = abs(norm - len_t);
    
    if diff < 0.00000000001
        x
        break;
    end
    x = x/2;
end

%%
% simpson
norm = 21.85437391650173758897;

 x=0.001;
for i=0:2
    phi = 0:x:2*pi;
    fax=sqrt((sin(phi) + phi.*cos(phi)).^2 + (cos(phi) - phi.*sin(phi)).^2 + ...
        (cos(phi) .* cos(phi) - sin(phi) .* sin(phi)).^2);
    
    n=numel(phi)-1; h=(2*pi)/n;
   
    % simpson
    len_s = h/3*(fax(1)+2*sum(fax(3:2:end-2))+4*sum(fax(2:2:end))+fax(end));
    
    diff = abs(norm - len_s);
    
    if diff < 0.00000000001
        x
        break;
    end
     x = x/2;
end

 

 
 

