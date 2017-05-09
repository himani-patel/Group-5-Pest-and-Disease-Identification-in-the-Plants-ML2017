function TrainModel()
  [matrix_ROI,seg1] = LearnROI();
  [matrix_ROI_white,seg1_white]=LearnROIStage2();
  
  matrix_NROI=LearnNROI();
  
  Data=vertcat(matrix_ROI,matrix_NROI);
  Data_white=vertcat(matrix_ROI_white,matrix_NROI);
  
  training=fitcknn(Data(1:end,1:15),Data(1:end,16));
  training_white=fitcknn(Data_white(1:end,1:15),Data_white(1:end,16));
  
  segment_training=fitcknn(seg1(1:end,1:2),seg1(1:end,3));
  segment_training_white=fitcknn(seg1_white(1:end,1:2),seg1_white(1:end,3));
  
  save('Segment_Model_disease','segment_training');
  save('Model_disease','training');
  save('Segment_Model_white','segment_training_white');
  save('Model_white','training_white');
end