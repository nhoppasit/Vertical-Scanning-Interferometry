function h = orient(xx,yy,zz,dz_dx,dz_dy,offset)
% h = orient(xx,yy,zz,dz_dx,dz_dy,offset)

zz(zz==0) = NaN;

oz = (dz_dx*xx + dz_dy*yy - offset);
h = zz - oz;

h(isnan(h)) = 0;