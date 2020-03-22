function rectangle(file1,file2)
  data = readfile(file1);
  data1 = readfile(file2);
  n = 3; 
  f = 1.0;         
  %for file1
  m = size(data,1);
  if m<n; fprintf('M < 3 / error\n'); return; end
  a = zeros(m,n);
  a(:,1) = data(:,4) - data(:,2);
  a(:,2) = -(data(:,3) - data(:,1));
  a(:,3) = data(:,2) .* -a(:,2)  - data(:,1) .* a(:,1);
  [U,S,V] = svd(a);  % call matlab SVD routine
  v_min = V(:,n); % s and v are already sorted from largest to smallest
  if all(v_min < 0); v_min = -v_min; end % ?
  wvec = [v_min(1)/f v_min(2)/f v_min(3)];
  wvec = wvec / norm(wvec,2);
  %for file2
  a = zeros(m,n);
  a(:,1) = data1(:,4) - data1(:,2);
  a(:,2) = -(data1(:,3) - data1(:,1));
  a(:,3) = data1(:,2) .* -a(:,2)  - data1(:,1) .* a(:,1);
  [U,S,V] = svd(a);  % call matlab SVD routine
  v_min = V(:,n); % s and v are already sorted from largest to smallest
  if all(v_min < 0); v_min = -v_min; end % ?
  rvec = [v_min(1)/f v_min(2)/f v_min(3)];
  rvec = rvec / norm(rvec,2);
  fprintf('the direction vectors of the side1: (%f %f %f)\n',wvec );
  fprintf('the direction vectors of the side2: (%f %f %f)\n',rvec );
  fprintf('normal of the planar patch: (%f %f %f)\n',cross(wvec,rvec));



function data=readfile(file)
  f = fopen(file,'r');
  for i=1:4; fgets(f); end
  all = fscanf(f,'%f %f %f %f '); m = length(all)/4;
  data= reshape(all,4,m)';
  fclose(f);

