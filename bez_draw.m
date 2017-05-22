function c = bez_draw(window) 

% BEZ_DRAW : draw Bezier polygon
% c = bez_draw(window) 
% interactive input of control points c(k,:)
% with left mouse button (quit with other key)
% in window = [xmin xmax ymin ymax]

hold on;
axis(window); axis square;
t = linspace(0,1);
c = [];

% add control points and draw Bezier curve
while 1 
   [x, y, button] = ginput(1); 
   if button == 1 
      c = [c; x,y];
      cla;
      p = bez_val(c,t); 
      plot(p(:,1),p(:,2),c(:,1),c(:,2),'go--','LineWidth',3); 
   else
      return
end;
   end;