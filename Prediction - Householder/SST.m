function [x] = SST(A, b)
  [n m] = size(A);
  x = zeros(m,1);
  for i = m : -1 : 1
    x(i) = (b(i) - A(i,i+1:m)*x(i+1:m))/A(i,i);
  end
endfunction
    