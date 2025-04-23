function [r_pf, v_pf] = eci2perifocal(r_eci, v_eci, elements)
    i = deg2rad(elements.i);
    Omega = deg2rad(elements.Omega);
    omega = deg2rad(elements.omega);

    R = rotation_matrix(Omega, i, omega)';
    r_pf = R * r_eci;
    v_pf = R * v_eci;
end

function R = rotation_matrix(O, i, w)
    R = [cos(O)*cos(w)-sin(O)*sin(w)*cos(i), -cos(O)*sin(w)-sin(O)*cos(w)*cos(i), sin(O)*sin(i);
         sin(O)*cos(w)+cos(O)*sin(w)*cos(i), -sin(O)*sin(w)+cos(O)*cos(w)*cos(i), -cos(O)*sin(i);
         sin(w)*sin(i),                         cos(w)*sin(i),                        cos(i)];
end
