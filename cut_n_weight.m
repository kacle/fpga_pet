function [ weight_left, weight_right, points_act_left, points_act_right ] = cut_n_weight( points_work, sorter, deep, depth )
points_work = sort_by(points_work, sorter);
weight_left = [];
weight_right = [];
cut = 2^(depth-deep);
% ketto hatványánál vág, ha elég kicsi akkor vág 
% ha nem akkor balra megy tovább, jobra meg nulla
    if cut < size(points_work, 2)
        points_act_left = points_work(:, 1:cut);
        points_act_right = points_work(:, cut+1:end);
    else
        points_act_left = points_work;
        points_act_right = [1;1;1];
    end

    if deep == depth
       try 
            weight_left = points_act_left;
        catch ME
            weight_left = [0;0;0];
       end

       try 
            weight_right = points_act_right;
        catch ME
            weight_right = [0;0;0];
        end
    else
       weight_left = median(points_act_left(2:3, :), 2);
       weight_right = median(points_act_right(2:3, :), 2);
    end


end

