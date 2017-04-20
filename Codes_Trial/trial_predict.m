load Model_white.mat
  [matrix_Test,index_image]=LearnTest();
  Class =predict(training_white,matrix_Test);
  
  save index_image.mat index_image;
  save class.mat Class
  
  