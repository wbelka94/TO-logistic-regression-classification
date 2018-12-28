function [e_log_train, e_log_test, e_01_train, e_01_test] = errors(Y_train, Y_test, Y_pred_train, Y_pred_test)
  e_log_train = mean(log(1 + e.^((-1).*Y_pred_train.*Y_train)))
  e_log_test = mean(log(1 + e.^((-1).*Y_pred_test.*Y_test)))
  
  e_01_train = mean(Y_pred_train.*Y_train <= 0)
  e_01_test = mean(Y_pred_test.*Y_test <= 0)
end