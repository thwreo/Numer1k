function [cost] = compute_cost_pc(points, centroids)
  [n m] = size(points);
  [NC m] = size(centroids);
  cost = 0;
  
  for i = 1 : n
    min = norm(points(i,:) - centroids(1,:));
    for j = 1 : NC
      if min > norm(points(i,:) - centroids(j,:))
        min = norm(points(i,:) - centroids(j,:));
      end
    end
    cost = cost + min;
  end

endfunction