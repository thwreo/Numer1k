function [A, b] = generate_probabilities_system(rows)
	P = zeros(rows); % initializare 'matrice labirint'
	n = (rows*(rows+1))/2; % nr de intersectii
	v = zeros(1,n);
	b = zeros(1,n);
	k = 0;

	v(1) = 4;
	v(2) = -1;
	v(3) = -1;
	A = v; % prima linie din matricea densa A

	for i = 1 : rows
		for j = 1 : i
			k = k + 1;
			P(i,j) = k; % introducere intersectie in 'labirint'
		end
	end
  % P matrice inferior triunghiulara; contine indicii intersectiilor din labirint
	for i = 2 : rows
		for j = 1 : i
			v = zeros(1,n);
			a = P(i,j); 
			if j-1 == 0 || j+1>rows || P(i,j+1) == 0 
        v(a) = v(a) + 1; 
      end
      if P(i-1,j) > 0 
        v(P(i-1,j)) = -1; 
        v(a) = v(a) + 1; 
      end
      if j-1 > 0
        v(P(i-1,j-1)) = -1; 
        v(P(i,j-1)) = -1; 
        v(a) = v(a) + 2; 
      end
      if j+1 <= rows 
        if P(i,j+1) > 0 
          v(P(i,j+1)) = -1;
          v(a) = v(a) + 1;
        end
        if i+1 <= rows
          v(P(i+1,j)) = -1;
          v(P(i+1,j+1)) = -1;
          v(a) = v(a) + 2;
        end
      end
      if i+1 > rows
        b(a) = 1;
        v(a) = v(a) + 1;
      end
      A = [A; v];
		end
	end
  b = b';
endfunction