function [da_v, quad_meas_v] = perturb_quadratic_measure( avec, dispersion, index )

% build perturb vector
% amax = max( abs( avec(index) ) );
amax = max( abs( avec ) );
da   = amax / 50;
da_v = [-amax: da: amax - da]';
Nda  = length(da_v);

% run perturbation
quad_meas_v = zeros(Nda, 1);

for i = 1: Nda,
    
   da = da_v(i);
   
   avec_perturb        = avec;
   avec_perturb(index) = avec(index) + da;
   
   quad_meas_v(i) = quadratic_measure( avec_perturb, dispersion );
    
end




