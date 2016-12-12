function [points_sorted] = sort_by( points_work, mode )

points_ordered = zeros(size(points_work));

if mode == 'x'
    points_ordered(1, :) = points_work(2, :);
    points_ordered(2, :) = points_work(3, :);
    points_ordered(3, :) = points_work(1, :);
    points_ordered = sortrows(points_ordered')';
    
    points_sorted = zeros(size(points_work));
    points_sorted(1, :) = points_ordered(3, :);
    points_sorted(2, :) = points_ordered(1, :);
    points_sorted(3, :) = points_ordered(2, :); 
end
if mode == 'y'
    points_ordered(1, :) = points_work(3, :);
    points_ordered(2, :) = points_work(2, :);
    points_ordered(3, :) = points_work(1, :);
    points_ordered = sortrows(points_ordered')';
    
    points_sorted = zeros(size(points_work));
    points_sorted(1, :) = points_ordered(3, :);
    points_sorted(2, :) = points_ordered(2, :);
    points_sorted(3, :) = points_ordered(1, :);
end


end

