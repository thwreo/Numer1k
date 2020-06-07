function [sol] = rgbHistogram(path_to_image, count_bins)
   img = imread(path_to_image);
   
  [n m] = size(img(:,:,1));
  nr = n*m;
  f = 256/count_bins;
  r = img(:,:,1)(:)';
  g = img(:,:,2)(:)';
  b = img(:,:,3)(:)';
  
  for i = 0 : count_bins - 1
    edges(i+1) = i*f;
  end
  
  edges(count_bins+1) = 256;
  sol = [histc(r,edges)(1:count_bins) histc(g,edges)(1:count_bins) histc(b,edges)(1:count_bins)];
  
endfunction