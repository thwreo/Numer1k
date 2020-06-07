function [w] = learn(X, y)
  [n m] = size(X);
  o = ones(n,1);
  X = [X o];
  [Q R] = Householder(X);
  y = Q' * y;
  w = SST(R,y);
end
