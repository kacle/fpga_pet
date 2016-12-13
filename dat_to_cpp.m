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
[tu_index, road] = kd_search(kd_matrix_values, pozi);

%plot the results
hold on
plot(kd_matrix_values(18, 1:400), kd_matrix_values(19, 1:400), 'r.')
plot(kd_matrix_values(1, 1:2), kd_matrix_values(2, 1:2), 'ro')
plot(kd_matrix_values(3, 1:4), kd_matrix_values(4, 1:4), 'b*')
plot(kd_matrix_values(5, 1:7), kd_matrix_values(6, 1:7), 'ko')
legend('Leafs (9th layer)', '1st layer', '2nd layer', '3rd layer')
% plot(pozi(1), pozi(2), 'bo')
% plot(tu_index(2), tu_index(3), 'g*')
% plot(road(:, 1), road(:, 2), 'ko')
% legend('Leafs', 'Input point', 'Output point', 'Road')
title('KD-tree')
