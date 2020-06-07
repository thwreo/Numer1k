function [values colind rowptr] = matrix_to_csr(A)
  [n m] = size(A);
  ir = 1;
  iv = 1;
  for i = 1 : n
    check = 1;
    for j = 1 : m
      if A(i,j) ~= 0
        values(iv) = A(i,j);
        colind(iv) = j;
        iv = iv + 1;
        if check ~= 0 
          rowptr(ir) = iv-1;
          ir = ir + 1;
          check = 0;
        end
      end
    end
  end
  rowptr(ir) = iv;
endfunction