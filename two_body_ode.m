function dydt = two_body_ode(~, y)
    global mu
    r = y(1:3);
    v = y(4:6);
    r_norm = norm(r);
    a = -mu * r / r_norm^3;
    dydt = [v; a];
end
