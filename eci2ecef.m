function r_ecef = eci2ecef(r_eci, t)
    % t in seconds from epoch
    theta = mod(280.46061837 + 360.9856473 * (t / 86400), 360);
    theta_rad = deg2rad(theta);
    R = [cos(theta_rad), sin(theta_rad), 0;
        -sin(theta_rad), cos(theta_rad), 0;
         0, 0, 1];
    r_ecef = R * r_eci;
end
