function quad_measure = quadratic_measure(avec, dispersion)

% function:     quadratic_measure()
% descript:     Computes the quadratic measure of avec on the dispersion
%               matrix. 
%
% inputs:       /avec/          vector of notional amounts
%               /dispersion/    pos def matrix that represents dispersion.
%
% outputs:      /quad_measure/  the quadratic measure

quad_measure = avec(:)' * dispersion * avec(:);




