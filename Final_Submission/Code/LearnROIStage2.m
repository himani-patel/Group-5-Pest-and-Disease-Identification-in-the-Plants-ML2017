function [mat,seg1] = LearnROIStage2
  folderName='D:\Semester7\BTP\btpcodes\Final\ROI_White\';
  extension='*.jpg';
  concattedString=strcat(folderName, extension);
  fileSet=dir(concattedString);
  l=1;
  cellSize=35;
  applyMat = zeros(cellSize,cellSize,3);
  for i = 1:length(fileSet)
    i
      I=imread(strcat(folderName, fileSet(i).name));  
      [r,c,d]=size(I);
%       for k=1:cellSize
%         if(mod((r+k),cellSize)==0)
%           row=r-(cellSize-k);
%         end
%         if(mod((c+k),cellSize)==0)
%           col=c-(cellSize-k);
%         end
%       end 
    for j =(round(cellSize/2)):10:(r-(round(cellSize/2)))
      for k = (round(cellSize/2)):10:(c-(round(cellSize/2)))
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
        mat(l,16)=0;
        
        seg1(l,1)=hsv(round(cellSize/2),round(cellSize/2),1);
%         seg1(l,2)=hsv(round(cellSize/2),round(cellSize/2),2);
        seg1(l,2)=hsv(round(cellSize/2),round(cellSize/2),3);
%         seg1(l,4)=applyMat(round(cellSize/2),round(cellSize/2),1);
%         seg1(l,5)=applyMat(round(cellSize/2),round(cellSize/2),2);
%         seg1(l,6)=applyMat(round(cellSize/2),round(cellSize/2),3);
        seg1(l,3)=1;
        
        l=l+1;
      end
    end 
  end
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 folderName='D:\Semester7\BTP\btpcodes\Final\ROI_Leaf\';
  extension='*.jpg';
  concattedString=strcat(folderName, extension);
  fileSet=dir(concattedString);
  cellSize=35;
  applyMat = zeros(cellSize,cellSize,3);
  for i = 1:length(fileSet)
    i
      I=imread(strcat(folderName, fileSet(i).name));  
      [r,c,d]=size(I);
%       for k=1:cellSize
%         if(mod((r+k),cellSize)==0)
%           row=r-(cellSize-k);
%         end
%         if(mod((c+k),cellSize)==0)
%           col=c-(cellSize-k);
%         end
%       end 
    for j =(round(cellSize/2)):10:(r-(round(cellSize/2)))
      for k = (round(cellSize/2)):10:(c-(round(cellSize/2)))
        applyMat = I(j-(round(cellSize/2)-1):j+(round(cellSize/2)-1),k-(round(cellSize/2)-1):k+(round(cellSize/2)-1),1:3);
        IG=rgb2gray(applyMat);
        hsv=rgb2hsv(applyMat);
        hue=hsv(:,:,1);
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
        mat(l,16)=0;
        
        seg1(l,1)=hsv(round(cellSize/2),round(cellSize/2),1);
%         seg1(l,2)=hsv(round(cellSize/2),round(cellSize/2),2);
         seg1(l,2)=hsv(round(cellSize/2),round(cellSize/2),3);
%         seg1(l,4)=applyMat(round(cellSize/2),round(cellSize/2),1);
%         seg1(l,5)=applyMat(round(cellSize/2),round(cellSize/2),2);
%         seg1(l,6)=applyMat(round(cellSize/2),round(cellSize/2),3);
        seg1(l,3)=0;
        
        l=l+1;
      end
    end 
  end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end