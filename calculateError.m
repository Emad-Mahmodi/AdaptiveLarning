function [MeanOurWork, MyError1 , MySquaredError , MyMeanSquaredError , MyRMSE] = calculateError(result_ourwork )

MeanOurWork = mean(result_ourwork);
MyError1 = (result_ourwork - MeanOurWork);    % Errors
MySquaredError =(result_ourwork - MeanOurWork).^2;   % Squared Error
MyMeanSquaredError = mean((result_ourwork - MeanOurWork).^2);   % Mean Squared Error
MyRMSE = sqrt(mean((result_ourwork - MeanOurWork).^2));  % Root Mean Squared Error

