function Y = rk4_integrator(odefun, y0, tspan)
    h = tspan(2) - tspan(1);
    Y = zeros(length(tspan), length(y0));
    Y(1,:) = y0';
    for k = 1:length(tspan)-1
        t = tspan(k);
        y = Y(k,:)';
        k1 = odefun(t, y);
        k2 = odefun(t + h/2, y + h/2 * k1);
        k3 = odefun(t + h/2, y + h/2 * k2);
        k4 = odefun(t + h, y + h * k3);
        Y(k+1,:) = (y + h/6*(k1 + 2*k2 + 2*k3 + k4))';
    end
end
