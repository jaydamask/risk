function ref_corr_matrix = reference_correlation_matrix(dim, type)

if strcmp(type, 'efx'),
    
    % an example
    ref_corr_matrix = [
        1      -0.36   0.07    -0.46   -0.19   0.15;
        -0.36   1       0.06     0.23    0.34  -0.24;
        0.07    0.06    1       -0.07    0.2   -0.2;
        -0.46   0.23   -0.07     1       0.1   -0.1;
        -0.19   0.34    0.2      0.1     1     -0.41;
        0.15   -0.24   -0.2     -0.1    -0.41   1
        ];
    
    % set correlations that are |.| < thresh to zero
    if 1 == 1,
        
        rdim = size(ref_corr_matrix,1);
        for i = 1: rdim,
            for j = i: rdim,
                if (abs(ref_corr_matrix(i,j)) < 0.25),
                    ref_corr_matrix(i,j) = 0;
                    ref_corr_matrix(j,i) = 0;
                end
            end
        end
        
    end
    
end


if strcmp(type, 'theory'),
    
    % reference eigenvalues
    lambda_ref = [0.05: 0.05: 1];
    
    % reference declination angles
    angle_ref  = [
        0     0       0       0       0       0;
        10    0       0       0       0       0;
        20    10      0       0       0       0;
        30    20      10      0       0       0;
        40    30      20      10      0       0;
        50    40      30      20      10      0
        ];
    
    % subselect dim-specific components
    lambda_m = lambda_ref(1:dim);
    angle_m  = angle_ref(1:dim, 1:dim) * pi / 180;
    
    % construct the rotation matrix, a flip-corrected eigenvector matrix
    vector_m = build_rotation_matrix(angle_m);
    
    % build a pos def matrix
    M_posdef = vector_m * diag(lambda_m) * vector_m.';
    
    % normalize out to arrive at a corr matrix
    s = diag(M_posdef);
    
    ref_corr_matrix = M_posdef ./ sqrt( s * s' );
    
end


