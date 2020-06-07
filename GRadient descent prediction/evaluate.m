function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats = strcat(path_to_testset,"/cats/");
  cats = strcat(cats,ls(cats));
  n_cats = strcat(path_to_testset,"/not_cats/");
  n_cats = strcat(n_cats,ls(n_cats));
  
  nrc = size(cats)(1) - 1;
  nrnc = size(n_cats)(1) - 1;
  
  percentage = 0;
  
  
  for i = 1 : nrc
    if histogram == "RGB"
      XC(i,:) = rgbHistogram(deblank(cats(i,:)),count_bins);
    else
      XC(i,:) = hsvHistogram(deblank(cats(i,:)),count_bins);
    end
  end
 
  for i = 1 : nrnc
    if histogram == "RGB"
      XCn(i,:) = rgbHistogram(deblank(n_cats(i,:)),count_bins);
    else
      XCn(i,:) = hsvHistogram(deblank(n_cats(i,:)),count_bins);
    end
  end
  
  o = ones(nrc+nrnc,1);
  X = [XC ;XCn]; % matrice caracteristici toate pozele
  X = (X - mean(X)) ./ std(X); % matrice caracteristici toate pozele scalata
  X = [X o]; % X_tilda
  
  pic_cats = sum(X(1:nrc,:) * w' >= 0); % nr poze cu pisici
  pic_n_cats = sum(X(nrc+1:nrc+nrnc,:) * w' < 0); % nr poze fara pisici
  percentage = (pic_cats + pic_n_cats)/(nrc+nrnc);
endfunction