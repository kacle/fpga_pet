format long
% initialize input
poziciok =  'poziciok.dat';
poziciok_xy = importdata(poziciok).*100000;
poziciok_xy = poziciok_xy';
tu_index = 1:400;
poziciok_xyi = [ tu_index; poziciok_xy];

%build kd_tree
kd_matrix_values = kd_matrix(poziciok_xyi, 9);

% find random element of the poziciok.dat
pozi = [37675806;47522527];
tu_index = kd_search(kd_matrix_values, pozi);

%plot the results
hold on
plot(kd_matrix_values(18, 1:400), kd_matrix_values(19, 1:400), 'r*')
plot(pozi(1), pozi(2), 'b*')
plot(tu_index(2), tu_index(3), 'k*')
title('KD-tree')
legend('Leafs', 'Input point', 'Output point')