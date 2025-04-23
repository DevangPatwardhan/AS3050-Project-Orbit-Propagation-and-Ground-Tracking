function propagate_orbit(r0, v0, name)
    global mu

    y0 = [r0; v0];
    tspan = 0:10:86400;

    % ODE45
    [t, Y_ode45] = ode45(@two_body_ode, tspan, y0);

    % RK4
    Y_rk4 = rk4_integrator(@two_body_ode, y0, tspan);

    % Plotting
    figure; hold on;
    plot3(Y_ode45(:,1), Y_ode45(:,2), Y_ode45(:,3), 'b', 'DisplayName','ODE45');
    plot3(Y_rk4(:,1), Y_rk4(:,2), Y_rk4(:,3), 'r--', 'DisplayName','RK4');
    xlabel('x [km]'); ylabel('y [km]'); zlabel('z [km]');
    title([name ' Trajectory in ECI']);
    legend; grid on; axis equal;
end
