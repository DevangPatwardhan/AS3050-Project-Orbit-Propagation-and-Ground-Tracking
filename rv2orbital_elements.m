function elements = rv2orbital_elements(r, v)
    global mu
    r_norm = norm(r);
    v_norm = norm(v);

    h = cross(r, v);
    h_norm = norm(h);

    a = 1 / (2/r_norm - v_norm^2/mu);
    e_vec = (cross(v, h) / mu) - r / r_norm;
    e = norm(e_vec);

    i = acos(h(3)/h_norm);
    N = cross([0 0 1]', h);
    Omega = atan2(N(2), N(1));

    omega = atan2(dot(cross(N, e_vec), h/h_norm), dot(N, e_vec));
    E0 = atan2(dot(r, v)/sqrt(mu*a), 1 - r_norm/a);
    M0 = E0 - e * sin(E0);

    elements = struct('a', a, 'e', e, 'i', rad2deg(i), ...
        'Omega', rad2deg(mod(Omega, 2*pi)), ...
        'omega', rad2deg(mod(omega, 2*pi)), ...
        'M0', rad2deg(mod(M0, 2*pi)));
end
