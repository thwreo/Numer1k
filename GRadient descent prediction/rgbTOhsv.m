function [h,s,v] = rgbTOhsv(rgb)
  r = double(rgb(:,:,1)(:));
  g = double(rgb(:,:,2)(:));
  b = double(rgb(:,:,3)(:));
 
  m = max(max(r,g),b);
  dif = m - min(min(r,g),b);
  
  v = double(m/255);
  h = zeros(size(v));
  s = dif./m;
  
  cmp = (r==m);
  hue = 0.0 + (g-b)./dif; 
  h(cmp) = hue(cmp);
  cmp = (g==m);
  hue = 2.0 + (b-r)./dif; 
  h(cmp) = hue(cmp);
  cmp = (b==m);
  hue = 4.0 + (r-g)./dif; 
  h(cmp) = hue(cmp);

  h(dif==0) = 0;
  s(dif==0) = 0;

  h = h * 60;
  h = mod(h, 360);

  h = h/360;
  
  h = h';
  s = s';
  v = v';
  
endfunction