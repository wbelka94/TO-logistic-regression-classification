 function [] = epoch_error(Y_train, Y_test, Y_pred_train, Y_pred_test, W, W_epoch, X_train, NR_e_log_train, NR_e_01_train)
   
  step = 0.1;
  
  e_log_epoch = [];
  e_01_epoch = [];
  
  epoch_num = size(W_epoch, 2);
  for i=1:epoch_num
    Y_pred = X_train*W_epoch(:, i);
    e_log_epoch = [e_log_epoch, mean(log(1 + e.^((-1).*Y_pred.*Y_train)))];
    e_01_epoch = [e_01_epoch, mean(Y_pred.*Y_train <= 0)];
  end
  
  f = figure();
  plot(1:epoch_num, e_log_epoch, "-b;Stochastyczny spadek wzdluz gradientu;",
    1:epoch_num, NR_e_log_train*ones(epoch_num, 1)', "--r;Newton-Raphson;");
  title('Zaleznosc bledu logisitycznego od epok');
  xlabel('epoka');
  ylabel('wartosc bledu');
  axis( [0 epoch_num 0 max(e_log_epoch)+step] );
  saveas(f, 'results/Zaleznosc_bledu_logisitycznego_od_epok.png');
  
  f = figure();
  plot(1:epoch_num, e_01_epoch, "-b;Stochastyczny spadek wzdluz gradientu;",
    1:epoch_num, NR_e_01_train*ones(epoch_num, 1)', "--r;Newton-Raphson;");
  title('Zaleznosc bledu 0/1 od epok');
  xlabel('epoka');
  ylabel('wartosc bledu');
  axis( [0 epoch_num 0 max(e_01_epoch)+step] );
  saveas(f, 'results/Zaleznosc_bledu_01_od_epok.png');