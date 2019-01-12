function [xx,yy,zz]= vsi_all(varargin)
% vsi_all(im_struc,s,e,[c,r],mask,[df,ds,fo],dh,'method')
%   method = {'smooth','polyfit'}

global height

%%
try
    %% Inputs
    disp('���ѧ��������...')
    
    im_struc = varargin{1};
    s = varargin{2};
    e = varargin{3};
    cx = varargin{4}(1);
    cy = varargin{4}(2);
    r = varargin{4}(3);
    mask = varargin{5};
    df = varargin{6}(1);
    ds = varargin{6}(2);
    fo = varargin{6}(3);
    dh = varargin{7};
    method = varargin{8};
    
    hf1 = figure; % �Դ����
    hf2 = figure; % �Դ����
    
    %% ������鹾�鹼��
    xci = linspace(cx - r,cx + r,180);
    y1 = sqrt(r^2 - (xci-cx).^2) + cy;
    y2 = -sqrt(r^2 - (xci-cx).^2) + cy;
    gray_img = im_struc(1).gray_img;
    [ny,nx] = size(gray_img);
    [xx,yy] = meshgrid(1:nx,1:ny);
    zz = xx*0;
    figure(hf2)
    surf(xx,yy,zz)
    shading interp
    colormap(copper);
    axis ij
    view(2)
    drawnow
    
    %% ��������
    for ri = 1:ny
        %% ������
        if mask(ri,round(nx/2))==1
            [ye,ys,x_mid,zz] = vsi_row([s,e],im_struc,[hf1,hf2],ri,[cx,cy,r],xci,y1,y2,dh,[df,ds,fo],method,xx,yy,zz);
            height = zz;
        end % in the mask
    end % row
    disp('�ʴ�������ҧ�����������')
catch ex
    warning on, warning(ex.message), warning off
    fprintf('\nPress any key to continue.\n');
    pause
end

