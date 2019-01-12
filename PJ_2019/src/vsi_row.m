function [varargout] = vsi_row(varargin)
%[ye,ys,x_mid,zz] = vsi_row([s,e],im_struc,[ax1,ax2,ax3],[ci,ri],[cx,cy],xci,y1,y2,dh,[df,ds,fo],method,xx,yy,zz)
global hImage hCenter hCircular % For image axis

load vsi_last_folder;
load([folder_name '/vsi_data/image_family.mat'])

s = varargin{1}(1);
e = varargin{1}(2);
gray_struc = varargin{2};
axImage = varargin{3}(1);
axVSI = varargin{3}(2);
axSurface = varargin{3}(3);
ri = varargin{4};
cx = varargin{5}(1);
cy = varargin{5}(2);
r = varargin{5}(3);
xci = varargin{6};
y1 = varargin{7};
y2 = varargin{8};
dh = varargin{9};
df = varargin{10}(1);
ds = varargin{10}(1);
pd = varargin{10}(1);
method = varargin{11};
xx = varargin{12};
yy = varargin{13};
zz = varargin{14};

ci_edge(1) = sqrt(r^2 - (ri-cy).^2) + cx;
ci_edge(2) = -ci_edge(1) + 2*cx;
ci_edge = round(ci_edge);

ci = ci_edge(2):ci_edge(1);
for im_id = s:e % จากทุกรูป
    gray_img = gray_struc(im_id).gray_img;  % ต้องโหลดไว้แล้ว
    I(:,im_id) = gray_img(ri,ci)';
    cla(axImage);
    hImage = imshow(gray_img,'Parent',axImage);
    hold(axImage,'on');
    hCenter = plot(axImage,cx,cy,'+r',ci,ri*ones(size(ci)),'--y');
    hCircular = plot(axImage,xci,y1,'--r',xci,y2,'--r');
    title(axImage,[num2str(im_id) '.' imFamily ', Row: ' num2str(ri)])
    axis(axImage,'on')
    colormap(axSurface,'gray');
    hold(axImage,'off');    
    drawnow
    cla(axVSI)
    plot(axVSI,[s:im_id]*dh,I);
    axis(axVSI,[s*dh e*dh 0 255]);
    title(axVSI,['Scan: ' num2str(im_id*dh) ' nm']);
    drawnow
end
%% แสดงผล
ici = 1;
hp = [];
hs = [];
for ci = ci_edge(2):ci_edge(1)
    smooth_df = length(I(ici,:))/df;
    xi = [s:e]*dh;
    ye = env_secant(xi,double(I(ici,:)),smooth_df,'top');
    if strcmp(method,'polyfit')
        pl = polyfit(xi,ye, pd);
        ys = polyval(pl,xi);
    elseif strcmp(method,'smooth')
        ys = smooth(ye,ds);
    else
        ys = ye;
    end
    
    if ~isempty(hp), delete(hp); end
    hold(axVSI,'on');
    axis(axVSI,[s*dh e*dh 0 255])
    mys = max(ys);
    mid = round(mean(find(ys==mys)));
    hp = plot(axVSI,xi,ye,'--r',xi,ys,'b',xi(mid),mys,'ob');
    title(axVSI,['Maximum : <' num2str(mid) ',' num2str(xi(mid)) ' nm >'])
    hold(axVSI,'off');
    drawnow
    
    zz(ri,ci) = mid*dh;
    cla(axSurface);
    surf(axSurface,xx,yy,zz);
    shading(axSurface,'interp');
    colormap(axSurface,'jet');
    axis(axSurface,'ij');
    [H,W] = size(zz);
    axis(axSurface,[1,W,1,H]);
    view(axSurface,2)
    title(axSurface,['Last state : <' num2str(ci) ',' num2str(ri) ',' num2str(mid*dh) ' nm>'])
    drawnow
    
    varargout{1} = ye;
    varargout{2} = ys;
    varargout{3} = xi(mid);
    varargout{4} = zz;
    ici = ici + 1;
    save([folder_name '/vsi_data/vsi_temp.mat'],'ri','ci','zz')    
    startID = s;
    endID = e;
    save([folder_name '/vsi_data/analysis_curves.mat'],'startID','endID','dh','I','xi','ye','ys','mid','mys');
end

