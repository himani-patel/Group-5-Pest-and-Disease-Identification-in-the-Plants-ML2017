        function [Class,index_image] = predictModel
  load Model_white.mat
  [matrix_Test,index_image]=LearnTest();
  Class =predict(training_white,matrix_Test);
end

