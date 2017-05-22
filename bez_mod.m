function c = bez_mod(c) 

% BEZ_MOD : modifies Bezier control polygon 
% c = bez_mod(c) 
% mark control point with left mouse 
% (quit with other key) 
% mark specify new position 

np1 = size(c,1);
hold on;
t = linspace(0,1);
p = bez_val(c,t); 
h=plot(p(:,1),p(:,2),c(:,1),c(:,2),'ro--','LineWidth',2);

while 1  
   waitforbuttonpress()
   if ~strcmp(get(gcf,'selectiontype'),'normal');   
      return
   else          
     ck=get(gca,'currentpoint')';
     dist=(c(:,1)-ck(1)).^2+(c(:,2)-ck(2)).^2;
     [m,k] = min(dist); 
     set(gcf,'windowbuttonmotionfcn',@(d1,d2)move(h,k));
     waitforbuttonpress()
     ck=get(gca,'currentpoint')';
     c(k,:)=ck(1:2);
     set(gcf,'windowbuttonmotionfcn','');     
   end;
end;

function move(h,k)
cp=get(gca,'currentpoint')';
c=[get(h(2),'xdata');get(h(2),'ydata')]';
c(k,:)=cp(1:2);
set(h(2),'xdata',c(:,1));set(h(2),'ydata',c(:,2));
t=linspace(0,1);
p = bez_val(c,t); 
set(h(1),'xdata',p(:,1));set(h(1),'ydata',p(:,2));