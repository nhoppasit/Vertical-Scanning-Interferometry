function [env] = env_secant(x_data, y_data, view, side) 
% Function call: env_secant(x_data, y_data, view, side) 
% Calculates the top envelope of data <y_data> over <x_data>.
% Method used: 'secant-method'
% env_secant() observates the max. slope of about <view> points,
% and joints them to the resulting envelope.
% An interpolation over original x-values is done finally.
% <side> ('top' or 'bottom') defines which side to evolve.
% Author: Andreas Martin, Volkswagen AG, Germany

if nargin == 0
    test( false );
    test( true );
    return
end


side = strcmpi( {'top','bottom'}, side ) * [ 1 ; -1 ];

assert( view > 1, ...
       'Parameter <view> too small!' );
assert( ndims (x_data) == 2, ...
       'Parameter <x_data> has to be vector type!' );
assert( size (x_data, 1) == 1 || size (x_data, 2) == 1, ...
       'Parameter <x_data> has to be vector type (Nx1)!' );
assert( ndims (y_data) == 2, ...
       'Parameter <y_data> has to be vector type (Nx1)!' );
assert( size (y_data, 1) == 1 || size (y_data, 2) == 1, ...
       'Parameter <y_data> has to be vector type (Nx1)!' );
assert( length (x_data) == length (y_data), ...
       'Parameters <x_data> and <y_data> must have same length!' );
assert( side ~= 0, ...
       'Parameter <side> must be ''top'' or ''bottom''' );

x_diff = diff( x_data );
x_diff = [min(x_diff), max(x_diff)];
assert( x_diff(1) > 0, '<x_data> must be monotonic increasing!' );

y_data = y_data(:);
data_len = length( y_data );
x_new = [];
y_new = [];

if diff( x_diff ) < eps( max(x_data) ) + eps( min(x_data) )
    % x_data is equidistant
    search_fcn = @( y_data, ii, i ) ...
                 max( ( y_data(ii) - y_data(i) ) ./ (ii-i)' .* side );
else
    % x_data is not equidistant
    search_fcn = @( y_data, ii, i ) ...
                 max( ( y_data(ii) - y_data(i) ) ./ ( x_data(ii) - x_data(i) ) * side );
end


i = 1;
while i < data_len;
    ii = i+1:min( i + view, data_len );
    [ m, idx ] = search_fcn( y_data, ii, i );

    % New max. slope: store new "observation point"
    i = i + idx;
    x_new(end+1) = x_data(i);
    y_new(end+1) = y_data(i);
end;

env = interp1( x_new, y_new, x_data, 'linear', 'extrap' );


function test( flagMonotonic )
    npts = 100000;
    y_data = cumsum( randn( npts, 1 ) ) .* cos( (1:npts)/50 )' + 100 * cos( (1:npts)/6000 )';
    if flagMonotonic
        x_data = (1:npts) + 10;
    else
        x_diff = rand( size( y_data ) );
        x_data = cumsum( x_diff );
    end

    view = ceil( npts * 0.01 ); % 1 Percent of total length
    env_up = env_secant( x_data, y_data, view, 'top' );
    env_lo = env_secant( x_data, y_data, view, 'bottom' );
    
    figure
    plot( x_data, y_data, '-', 'Color', 0.8 * ones(3,1) );
    hold all
    h(1) = plot( x_data, env_up, 'b-', 'DisplayName', 'top' );
    h(2) = plot( x_data, env_lo, 'g-', 'DisplayName', 'bottom' );
    
    grid
    legend( 'show', h )