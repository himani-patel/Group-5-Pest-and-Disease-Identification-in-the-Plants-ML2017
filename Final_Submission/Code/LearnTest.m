%function [mat,index_image] = LearnTest
  folderName='/media/divya/EDUCATION/SEAS_6th_Sem/ML/BTP_Codes/Test/';
  extension='*.jpg';
  concattedString=strcat(folderName, extension);
  fileSet=dir(concattedString);
  l=1;
  cellSize=35;
  applyMat = zeros(cellSize,cellSize,3);
  for i = 1:length(fileSet)
      I=imread(strcat(folderName, fileSet(i).name));  
      [r,c,d]=size(I);

      
    for j =(round(cellSize/2)):cellSize:(r-(round(cellSize/2)))
      for k = (round(cellSize/2)):cellSize:(c-(round(cellSize/2)))
        applyMat = I(j-(round(cellSize/2)-1):j+(round(cellSize/2)-1),k-(round(cellSize/2)-1):k+(round(cellSize/2)-1),1:3);
        IG=rgb2gray(applyMat);
        hsv=rgb2hsv(applyMat);
        hue=hsv(:,:,1);
        value=hsv(:,:,3);
      
        prop=graycoprops(graycomatrix(IG,'NumLevels',256));
        mat(l,1)=prop.Correlation;
        mat(l,2)=prop.Energy;
        mat(l,3)=prop.Homogeneity;
        mat(l,4)=prop.Contrast;
        mat(l,5)=mean2(applyMat(:,:,1));   
        mat(l,6)=mean2(applyMat(:,:,2));    
        mat(l,7)=mean2(applyMat(:,:,3));
        mat(l,8)=std2(applyMat(:,:,1));
        mat(l,9)=std2(applyMat(:,:,2));
        mat(l,10)=std2(applyMat(:,:,3));
        mat(l,11)=max(hue(:))-min(hue(:));
        [xdirection,ydirection]=imgradient(IG);
        mat(l,12)=mean2(xdirection);  
        mat(l,13)=entropy(IG);
        max_mat=max(hue(:));
        mat(l,14)=mean2(max_mat-hue);
        mat(l,15)=mean2(value);
        l=l+1;
      end
    end 
    index_image(i)=l-1;
  end
  
  save('Matrix_test_white','mat');
  save('index_image_white','index_image');
  
%end