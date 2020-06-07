function [G_J, c_J] = Jacobi_factorization(A, b)
  [n n] = size(A);
  N = zeros(n);
  P = -A;
  
  for i = 1 : n
    N(i,i) = A(i,i);
    P(i,i) = 0;
  end
  N = inv(N);
  G_J = N * P;
  c_J = N * b;
endfunction
