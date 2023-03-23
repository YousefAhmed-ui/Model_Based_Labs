%Rectangles
%Big Rect
xRect=[-10,10,10,-10,-10];
yRect=[50,50,-10,-10,50];
plot(xRect,yRect,'black');
fill(xRect,yRect,'black');
hold on;

%Small Rect
xRect=[-2,2,2,-2,-2];
yRect=[-10,-10,-50,-50,-10];
plot(xRect,yRect,'black');
fill(xRect,yRect,'black');
hold on;

%Circles
%Circle variables
r=7;
theta = 0:0.1:360;

%Green Circle
xg=r*sind(theta); 
yg=r*cosd(theta);
plot(xg,yg,'g');
hold on;

%Yellow Circle
xy=r*sind(theta); 
yy=r*cosd(theta)+20;
plot(xy,yy,'y');
hold on;

%Red Circle
xr=r*sind(theta); 
yr=r*cosd(theta)+40;
plot(xr,yr,'r');

while 1
    xlim([-80 80]);
    ylim([-80 80])
    %Red
    fill(xr,yr,'r');
    pause(2);
    fill(xr,yr,'black');

    %Yellow
    fill(xy,yy,'y');
    pause(2);
    fill(xy,yy,'black');

    %Green
    fill(xg,yg,'g');
    pause(2);
    fill(xg,yg,'black');

    %Red
    fill(xr,yr,'r');
    pause(2);
    fill(xr,yr,'black');
end



