% script:   position_path_ala_deng.m
% descript: 

% defs
dim = 6;

% get reference dispersion
disp = reference_correlation_matrix(dim, 'efx')

% set starting vector
avec = zeros(dim,1); avec(2) = 1;

% load path matrix
as = zeros(dim, 10); 
as(:,1) = avec;

% run position path
for k=2:10, 
    as(:,k)=optimize_one_step_ala_deng(as(:,k-1), disp); 
end

% metrics

% plots

% postition path
figure(1)
plot(as');
title('position path')

% total wealth
figure(2)
plot(sum(abs(as)));
title('total wealth')

% total path length of principal
figure(3)
plot(cumsum(as(2,:)));
title('total path length of principal')

% path lengths of other components
figure(4)
v = [1 3:6]';
plot(cumsum(abs(as(v,:))));
title('path lengths of other components')

% total path lengths of other components
figure(5)
plot(cumsum(sum(abs(as(v,:)))));
title('cumulative path lengths of other components');

% total path length all
figure(6)
plot(cumsum(sum(abs(as))));
title('total path length all')

% sum(sum(abs(diff(as')'),2))
% sum(as(2,:))
% plot(abs(as'))
% ax
% as
% sum(as)
% sum(abs(as))
% plot(sum(abs(as)))
% 
% 
% 
% disp = reference_correlation_matrix(4, 'theory')
% format compact
% avec = [0 1 0 0]';
% [da_v, q] = perturb_quadratic_measure(avec, disp, 2)
% [da_v, q] = perturb_quadratic_measure(avec, disp, 2);
% plot(q)
% [da_v, quad_meas_v] = perturb_quadratic_measure(avec, disp, 2);
% [v, i] = min(quad_meas_v)
% da_v(i)
% figure(!)
% figure(1)
% plot(da_v, q)
% optimize_one_step_ala_deng(avec, disp)
% disp
% ao = avec;
% as = avec;
% as = zeros(4,10)
% as
% ao
% %for k=2:10, as(:,k)=optimize_one_step_ala_deng(as(:,k-1), disp); end
% as(:,1)=avec;
% for k=2:10, as(:,k)=optimize_one_step_ala_deng(as(:,k-1), disp); end
% as
% plot(as(2,:))
% plot(as')
% diff(as)
% diff(as, 2)
% diff(as, 1)
% diff(as')
% diff(as')'
% sum(diff(as')')
% sum(diff(as')',2)
% sum(abs(diff(as')'),2)
% sum(sum(abs(diff(as')'),2))
% disp
% disp = reference_correlation_matrix(6, 'efx')
% avec = zeros(6,1); avec(2) = 1;
% dim = 6;
% as = zeros(dim, 10); as(:,1) = avec;
% for k=2:10, as(:,k)=optimize_one_step_ala_deng(as(:,k-1), disp); end
% figure(2)
% plot(as')
% sum(sum(abs(diff(as')'),2))
% sum(as(2,:))
% plot(abs(as'))
% ax
% as
% sum(as)
% sum(abs(as))
% plot(sum(abs(as)))



