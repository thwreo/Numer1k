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
      x = rgbHistogram(cats(i,:),count_bins);
    else
      x = hsvHistogram(cats(i,:),count_bins);
    end
    x = [x 1]';
    if w' * x  >= 0
      percentage = percentage + 1;
    end
  end

  for i = 1 : nrnc
    if histogram == "RGB"
      x = rgbHistogram(n_cats(i,:),count_bins);
    else
      x = hsvHistogram(n_cats(i,:),count_bins);
    end
    x = [x 1]';
    if w' * x  < 0
      percentage = percentage + 1;
    end
  end

  percentage = percentage/(nrc+nrnc);
endfunction