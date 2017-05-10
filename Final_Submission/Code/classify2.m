function [II,diseased_severity] = classify2(IRGB)
  load Segment_Model_white.mat
  I=rgb2hsv(IRGB);
  cellSize=35;
  [r,c,d]=size(I);
  l=1;
  for i=1:r
    for j=1:c
      if(I(i,j,1)~=0 && I(i,j,2)~=0 && I(i,j,3)~=0)
        example(l,1)=I(i,j,1);
%         example(l,2)=I(i,j,2);
        example(l,2)=I(i,j,3);

         l=l+1;
      end
    end
  end
  count_total=l-1;
  if(count_total==0)
    return;
  end
  predicted=predict(segment_training_white,example);
  
  l=1;
  count_diseased=0;
  
  for i=1:r
    for j=1:c
      if(I(i,j,1)~=0 && I(i,j,2)~=0 && I(i,j,3)~=0)
        if(predicted(l)==0)
          I(i,j,:)=0;
        end
        l=l+1;
      end
    end
  end
  %figure ,imshow(I);
  II=hsv2rgb(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for i=1:r
      for j=1:c
        if(II(i,j,1)~=0 && II(i,j,2)~=0 && II(i,j,3)~=0)
          count_diseased=count_diseased+1;
        end
      end
    end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
if(count_total ==0)
diseased_severity=0;
else
  diseased_severity=count_diseased/(count_total);
end
end