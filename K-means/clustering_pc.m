function [centroids] = clustering_pc(points, NC)
  [n m] = size(points);
  sum = zeros(NC,m);
  dim = zeros(NC,1);
  centroids = zeros(NC,m);
  prev_centroids = centroids;
  min = 0;

  
   for i = 1 : n
    x = mod(i,NC);
      if x ~= 0
        sum(x,:) = sum(x,:) + points(i,:);
        dim(x) = dim(x) + 1;
      else
        sum(NC,:) = sum(NC,:) + points(i,:);
        dim(NC) = dim(NC) + 1;
      end
   end
   
   for i = 1 : NC
     centroids(i, :) = sum(i,:) / dim(i);
   end
   
   while max(norm(centroids - prev_centroids, 2, m)) > 1e-5
     sum = zeros(NC,m);
     dim = zeros(NC,1);
     prev_centroids = centroids;
     for i = 1 : n
       min = norm(points(i,:) - centroids(1,:));
       index = 1;
       for j = 1 : NC
         if min > norm(points(i,:) - centroids(j,:))
           min = norm(points(i,:) - centroids(j,:));
           index = j;
         end
       end
       sum(index,:) = sum(index,:) + points(i,:);
       dim(index) = dim(index) + 1;
     end
     for i = 1 : NC
       centroids(i,:) = sum(i,:) / dim(i);
     end
  end 
endfunction

