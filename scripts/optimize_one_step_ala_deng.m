function avec_out = optimize_one_step_ala_deng( avec_in, dispersion )

% defs
dim = length(avec_in);
avec_out = zeros(dim, 1);

% initial quadratic measure
quad_meas_in = quadratic_measure( avec_in, dispersion );

% perturb each element
for k = 1: dim,
    
    [da_v, quad_meas_v] = perturb_quadratic_measure( avec_in, dispersion, k );
    
    [v, i] = min(quad_meas_v);
    
    da_star = da_v(i);
    
    avec_out(k) = avec_in(k) + da_star;
    
end






