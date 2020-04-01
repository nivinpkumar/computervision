def stereo_match(left_image, right_image, kernel, max_offset):

    left_image = Image.open(left_image).convert('L')
    left = np.asarray(left_image)
    right_image = Image.open(right_image).convert('L')
    right = np.asarray(right_image)    
    w, h = left_image.size    
    
    depth = np.zeros((w, h), np.uint8)
    depth.shape = h, w
       
    kernel_size = int(kernel / 2)    
    offset_adjust = 255 / max_offset  
      
    for y in range(kernel_size, h - kernel_size):      
        print("*", end="", flush=True)
        
        for x in range(kernel_size, w - kernel_size):
            best_offset = 0
            prev_ssd = 65534
            av_thres = 99999
            count =0
            depth_fin = 0
            
            for offset in range(max_offset):               
                sum_square_dist = 0
                ssd_temp = 0                            
                av = 0
                av_temp = 0
                av_final = 0
                disp_final = 0

                for v in range(-kernel_size, kernel_size):
                    for u in range(-kernel_size, kernel_size):
                        ssd_temp = int(left[y+v, x+u]) - int(right[y+v, (x+u) - offset])  
                        sum_square_dist += ssd_temp * ssd_temp
                        av_temp =  abs(int(left[y+v, x+u]) - int(right[y+v, (x+u) - offset]))
                        av += av_temp             
                
                if sum_square_dist < prev_ssd:
                    prev_ssd = sum_square_dist
                    best_offset = offset

                if av < av_thres:
                    av_thres = av
                    av_final = av_thres
                    count = offset
                            
            depth[y, x] = best_offset * offset_adjust