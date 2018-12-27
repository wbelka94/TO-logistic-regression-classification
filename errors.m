function [error_log_train, error_log_test, error_01_train, error_01_test] = errors(Y_train, Y_test, Y_pred_train, Y_pred_test)
  error_log_train = mean(log(1 + e.^((-1).*Y_pred_train.*Y_train)))
  error_log_test = mean(log(1 + e.^((-1).*Y_pred_test.*Y_test)))
  
  error_01_train = mean(Y_pred_train.*Y_train <= 0)
  error_01_test = mean(Y_pred_test.*Y_test <= 0)
end