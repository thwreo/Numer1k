function [sol] = hsvHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  [h,s,v] = rgbTOhsv(img);
  
  fh = 1.01/count_bins;
  fsv = 1.01/count_bins;
  
  for k = 0 : count_bins
    edgH(k+1) = fh*k;
    edgSV(k+1) = fsv*k;
  end
  
    sol = [histc(h,edgH)(1:count_bins) histc(s,edgSV)(1:count_bins) histc(v,edgSV)(1:count_bins)];

endfunction