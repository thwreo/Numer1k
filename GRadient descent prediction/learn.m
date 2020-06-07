function [w] = learn(X, y, lr, epochs)
  
  X = (X - mean(X)) ./ std(X);
  
  o = ones(size(X)(1),1);
  X = [X o];
  [n m] = size(X);
   
  w = -0.1 + (0.1 + 0.1)*rand(1,m);
  
  for e = 1 : epochs
    idx = randperm(n);
    Xb = X(idx(1:64),:);
    yb = y(idx(1:64));
    
    for i = 1 : m
      s =sum((Xb*w' - yb).*Xb(:,i));
      w(i) = w(i) - lr*1/64*s;
    end  
  end
endfunction
