 function [error_log_train, error_log_test, error_01_train, error_01_test] = epoch_error(Y_train, Y_test, Y_pred_train, Y_pred_test, W, W_epoch, X_train)
  error_log_epoch = [];
  error_01_epoch = [];
  
  epoch_num = size(W_epoch, 2);
  for i=1:epoch_num
    Y_pred = X_train*W_epoch(:, i);
    error_log_epoch = [error_log_epoch, mean(log(1 + e.^((-1).*Y_pred.*Y_train)))];
    error_01_epoch = [error_01_epoch, mean(Y_pred.*Y_train <= 0)];
  end
  
  f = figure();
  plot(1:epoch_num, error_log_epoch, "-r;SGD;",
    1:epoch_num, 0.33518*ones(epoch_num, 1)', "--b;Newton-Raphson;");
  title('Zaleznosc bledu logisitycznego od epok');
  xlabel('epoka');
  ylabel('wartosc bledu');
  axis( [0 epoch_num 0 max(error_log_epoch)+0.05] );
  saveas(f, 'results/Zaleznosc_bledu_logisitycznego_od_epok.png');
  
  f = figure();
  plot(1:epoch_num, error_01_epoch, "-r;SGD;",
    1:epoch_num, 0.14908*ones(epoch_num, 1)', "--b;Newton-Raphson;");
  title('Zaleznosc bledu 0/1 od epok');
  xlabel('epoka');
  ylabel('wartosc bledu');
  axis( [0 epoch_num 0 max(error_01_epoch)+0.05] );
  saveas(f, 'results/Zaleznosc_bledu_01_od_epok.png');
  
  f = figure();
  hist(W);
  title('Histogram wag - SGD');
  saveas(f, 'results/histogram_SGD.png');