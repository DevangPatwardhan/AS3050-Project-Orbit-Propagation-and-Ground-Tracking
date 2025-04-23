function plot_ground_track(r0, v0, name)
    global Re
    y0 = [r0; v0];
    tspan = 0:60:86400; % 24 hours with 1-minute resolution
    [~, Y] = ode45(@two_body_ode, tspan, y0);

    lats = zeros(size(tspan));
    lons = zeros(size(tspan));

    for i = 1:length(tspan)
        r_ecef = eci2ecef(Y(i,1:3)', tspan(i));
        [lats(i), lons(i)] = ecef2latlon(r_ecef);
    end

    % Wrap longitude between [-180, 180]
    lons = mod(lons + 180, 360) - 180;

    % Plot using Mapping Toolbox
    figure;
    ax = worldmap('World');
    load coastlines
    plotm(coastlat, coastlon, 'k')           % coastlines
    plotm(lats, lons, 'r', 'LineWidth', 1.2) % ground track
    title([name ' Ground Track (24 hrs)'])
end
