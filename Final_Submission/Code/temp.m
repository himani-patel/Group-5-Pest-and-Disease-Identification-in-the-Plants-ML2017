clear all;
clc;
%TrainModel();
[Class,index_image]=predictModel();
[I,severity]= segment(Class,index_image); 