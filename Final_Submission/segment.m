%function [I,severity]= segment(Class,index_image)
load class.mat
load index_image_white.mat

folderName='/media/divya/EDUCATION/SEAS_6th_Sem/ML/BTP_Codes/Test/';
  extension='*.jpg';
  concattedString=strcat(folderName, extension);
  fileSet=dir(concattedString); 
  index=find(Class(:)==0);
  cellSize=35;
  applyMat = zeros(cellSize,cellSize,3);
  l=1;
  for im = 1:length(fileSet)
    im
    I=imread(strcat(folderName, fileSet(im).name));  
    figure,imshow(I);
    [r,c,d]=size(I);
    for k=1:cellSize
      if(mod((r+k),cellSize)==0)
        row=r-(cellSize-k);
      end
      if(mod((c+k),cellSize)==0)
        col=c-(cellSize-k);
      end
    end
    I(:,col:c,:)=0;
    I(row:r,:,:)=0;
    for j =(round(cellSize/2)):cellSize:row
        for k = (round(cellSize/2)):cellSize:col
          if(Class(l)==1)
            I(j-(round(cellSize/2)-1):j+(round(cellSize/2)-1),k-(round(cellSize/2)-1):k+(round(cellSize/2)-1),1:3) = applyMat;            
          end
          l=l+1;
        end
    end
    figure,imshow(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     grayscale=rgb2gray(I);
%     [r,c]=size(grayscale);
%     for p=1:r
%       for q=1:c
%         if(grayscale(p,q)>0)
%           grayscale(p,q)=255;
%         end
%       end
%     end
%     removed_IG=bwareaopen(grayscale,((cellSize*cellSize)*10));
%     for p=1:r
%       for q=1:c
%         if(removed_IG(p,q)==0)
%           I(p,q,:)=0;
%         end
%       end
%     end
%     figure,imshow(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  [Out,disease_severity] = classify2(I);
    figure,imshow(Out);
    severity(im) = disease_severity;
  end
%end