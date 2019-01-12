close all;
ax1 = subplot(1,2,1);
surf(peaks);
h = zoom;
h.Enable = 'on';
ax2 = subplot(1,2,2);
I = imshow(rand(200,200),[]);
setAllowAxesRotate(h,ax2,false);
set(I,'ButtonDownFCN','disp(''clicked'')');
set(h,'ButtonDownFilter',@myRotateFilter);


