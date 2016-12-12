function [fotocsucs] = kd_search( kd_matrix, pozicio )
fotocsucs = 0;
index = [1,2];
depth = (size(kd_matrix, 1)-3)/2;
for deep = 1:depth

    d_left =abs( pozicio(1)-kd_matrix(index(1), index(2)-1) + pozicio(2)-kd_matrix(index(1)+1, index(2)-1));
    d_right = abs(pozicio(1)-kd_matrix(index(1), index(2)) + pozicio(2)-kd_matrix(index(1)+1, index(2)));
    if d_left >= d_right
       index = [((deep+1)*2)-1, index(2)*2];
    else
       index = [((deep+1)*2)-1, (index(2)-1)*2];
    end
end
d_left =abs( pozicio(1)-kd_matrix(index(1)+1, index(2)-1) + pozicio(2)-kd_matrix(index(1)+2, index(2)-1));
d_right = abs(pozicio(1)-kd_matrix(index(1)+1, index(2)) + pozicio(2)-kd_matrix(index(1)+2, index(2)));
if d_left < d_right
    index(2) = index(2)-1;
end

%fotocsucs = kd_matrix(index(1), index(2));
fotocsucs = kd_matrix(index(1):index(1)+2, index(2));
end