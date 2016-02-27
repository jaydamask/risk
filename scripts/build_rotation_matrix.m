function rotation_m = build_rotation_matrix( angle_m )

% defs 
dim = size(angle_m, 1);
I   = eye(dim);

% build up rotation from smallest dimension to largest
R = I;
for i = 2: dim,
    for j = 1: i - 1,
        
        Rij = build_specific_rotation_matrix( angle_m(i, j), dim, dim - i + 1, dim - j + 1 );        
        R   = Rij * R;
        
    end
end

% complete (I know it's a copy)
rotation_m = R;

end

function specific_rotation_m = build_specific_rotation_matrix( angle, dim_ref, dim1, dim2 )

% trig values
c = cos(angle);
s = sin(angle);

% start with identity matrix
ref = eye(dim_ref);

% insert c, s terms
ref(dim1, dim1) = c;
ref(dim2, dim2) = c;
ref(dim1, dim2) = s;
ref(dim2, dim1) = -s;

% I know it's a copy...
specific_rotation_m = ref;

end




