function [lat, lon] = ecef2latlon(r_ecef)
    global Re
    x = r_ecef(1); y = r_ecef(2); z = r_ecef(3);
    lon = atan2(y, x);
    lat = atan2(z, sqrt(x^2 + y^2));
    lat = rad2deg(lat);
    lon = rad2deg(lon);
end
