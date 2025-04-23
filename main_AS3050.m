clc; clear; close all;

% Load constants
constants;

% Initial Conditions
r0_iss = [3816.29528835335, -4368.35250152918, 3535.44389794826]'; % km
v0_iss = [2.39238139847429, 5.72591374356028, 4.49419132400820]';  % km/s

r0_mol = [11014.40116998668, -7331.031166728784, -36.75777000894374]';
v0_mol = [4.91677787148958, -0.383647387557357, 4.57359514140655]';

% Q2: Orbital elements from r0, v0
fprintf("=== ISS ORBIT ELEMENTS ===\n");
elements_iss = rv2orbital_elements(r0_iss, v0_iss)

fprintf("=== MOLNIYA ORBIT ELEMENTS ===\n");
elements_mol = rv2orbital_elements(r0_mol, v0_mol)

% Q3: ECI to Perifocal
[r_pf_iss, v_pf_iss] = eci2perifocal(r0_iss, v0_iss, elements_iss);
[r_pf_mol, v_pf_mol] = eci2perifocal(r0_mol, v0_mol, elements_mol);

% Q4: Orbit Propagation
fprintf("Propagating ISS and MOLNIYA orbits using ode45 and RK4...\n");
propagate_orbit(r0_iss, v0_iss, 'ISS');
propagate_orbit(r0_mol, v0_mol, 'MOLNIYA');

% Extra Credit: Ground Track
fprintf("Plotting ground tracks...\n");
plot_ground_track(r0_iss, v0_iss, 'ISS');
plot_ground_track(r0_mol, v0_mol, 'MOLNIYA');
