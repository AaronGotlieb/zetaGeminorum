pro flats
  arr = dialog_pickfile(/multiple_files);select images to process
  img = dblarr(1530,1020,n_elements(arr))
   
  for i = 0, n_elements(arr)-1 do begin;iterates through all the data images you have selected 
    img[*,*,i] = readfits(arr[i], header) ;runs through all of the images and stores the image data in a 3d array
  endfor            
  
  picarr = dblarr(1530,1020);the next two nested for loops go pixle by pixle to find the median for each image
  for i = 0, 1529 do begin
    for j =0, 1019 do begin
      picarr[i,j] = median(img[i,j,*])
    endfor
  endfor 
  
  outfile = dialog_pickfile(Title = "Why not select a name for your flat image?")
  writefits, outfile, picarr
  
  
end
