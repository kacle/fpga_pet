poziciok =  'poziciok.dat';
fotocsucsok =  'fotocsucs.dat';
format long
poziciok_xy = importdata(poziciok).*100000;
poziciok_xy = poziciok_xy';

fotocsucsok = 1:400;
% fotocsucsok = fotocsucsok';

poziciok_xyi = [ fotocsucsok; poziciok_xy];
%fileID = fopen('poziciok.txt', 'w');
%fprintf(fileID, '%d %d\n', fotocsucs2);

kd_matrix_values = kd_matrix(poziciok_xyi, 9);

pozi = [37675806;47522527]; %99. elem a kd_matrix_value-ban
tu_index = kd_search(kd_matrix_values, pozi);

hold on
plot(kd_matrix_values(18, 1:400), kd_matrix_values(19, 1:400), 'r*')
title('KD-tree')
plot(pozi(1), pozi(2), 'b*')
plot(tu_index(2), tu_index(3), 'k*')
legend('Leafs', 'Input point', 'Output point')