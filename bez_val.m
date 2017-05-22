function p = bez_val(c,t) 

% BEZ_VAL : evaluation of Bezier curves
% p = bez_val(c,t) 
% points p(j,:) on a Bezier curve 
% with control points c(k,:) at t(j)

n=size(c,1)-1;
b = zeros(length(t),2*n+1); 
b(:,n+1) = 1;

for k=1:n
   tk = repmat(t(:),1,2*n+1-k);
   b = (1-tk).*b(:,2:end) + tk.*b(:,1:end-1);
end
p=b*c;
