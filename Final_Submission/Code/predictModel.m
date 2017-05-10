


%function [Class,index_image] = predictModel
  load Model_white.mat
  load Matrix_test_white.mat
  %[matrix_Test,index_image]=LearnTest();
  Class =predict(training_white,mat);
  
  save('Class','Class')
%end

