function [ weights_matrix ] = kd_matrix4( points, depth )
weights_matrix = [];
points_act{1} = points;
points_next = {};
for deep = 1:depth
    counter = 1;
    weights_row = [];
    while  2^(deep-1) >= counter
        if mod(deep, 2) == 0
            sorter = 'x';
            points_work = points_act{counter};
            [weight_left, weight_right, points_act_left, points_act_right] = cut_n_weight(points_work, sorter, deep, depth);
        end
        
        
        if mod(deep, 2) == 1
            sorter = 'y';
            points_work = points_act{counter};
            [weight_left, weight_right, points_act_left, points_act_right] = cut_n_weight(points_work, sorter, deep, depth);   
        end
        weights_row = [weights_row, weight_left, weight_right];
        points_next{ (2*counter)-1} = points_act_left;
        points_next{ (2*counter)} = points_act_right;
        counter = counter+1;
    end
    points_act = points_next;

    help_weights = zeros(size(weights_row, 1), (2^depth)-(size(weights_row, 2)));
    weights_row = [weights_row, help_weights];

    weights_matrix = [weights_matrix; weights_row];
end


end