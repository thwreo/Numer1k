function [Q, R] = Householder(A)
  [n m] = size(A);
  Q = eye(n);
  
  for i = 1 : min(n-1, m)
    sigma = -norm(A(i:n, i));
    if A(i, i) < 0
      sigma = -sigma;
    end
    
    v(1:n, 1) = 0;
    v(i) = A(i, i) + sigma;
    v(i+1:n) = A(i+1:n, i);
    
    beta = sigma*v(i);
    
    if beta ~= 0
      A(i, i) = -sigma;
    
      A(i+1:n, i) = 0;
    
      for j = i+1 : m
        t = v(i:n)' * A(i:n, j)/beta;
        A(i:n, j) = A(i:n, j) - t*v(i:n);
      end
    
      for j = 1 : n
        t = v(i:n)' * Q(i:n, j)/beta;
        Q(i:n, j) = Q(i:n, j) - t*v(i:n);
      end
    end
  end
  R = A;
  Q = Q';
    
endfunction