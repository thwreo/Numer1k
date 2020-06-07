function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  cats = strcat(path_to_dataset, "/cats/");  
  n_cats = strcat(path_to_dataset, "/not_cats/");
  
  y = [ones(size(ls(cats))(1) - 1, 1); -ones(size(ls(n_cats))(1) - 1,1)];
  
  sc = strcat(cats,ls(cats));
  snc = strcat(n_cats,ls(n_cats));
  
  nc = size(sc)(1) - 1;
  nnc = size(snc)(1) - 1;
  
  X = zeros(nc+nnc, count_bins*3);
  
  for i = 1 : nc
    if histogram == "RGB"
      sol = rgbHistogram(sc(i,:), count_bins);
    elseif histogram == "HSV"
      sol = hsvHistogram(sc(i,:), count_bins);
    end
    X(i,:) = sol(:);
  end
  
  for i = 1 : nnc  
    if histogram == "RGB"
      sol = rgbHistogram(snc(i,:), count_bins);
    elseif histogram == "HSV"
      sol = hsvHistogram(snc(i,:), count_bins);
    end
    X(nc+i,:) = sol(:);
  end
  
endfunction
