function [] = main()
  [X_train, Y_train] = readdata("data/file21_train.txt", " ");
  [X_test, Y_test] = readdata("data/file21_test.txt", " ");
  
  n = size(X_train, 1);
  X_train = [ones(n, 1), X_train];
  n = size(X_test, 1);
  X_test = [ones(n, 1), X_test];
  
  # NewtonRaphson
  tic
  W = NewtonRaphson(X_train, Y_train);
  toc
  csvwrite('results/W_Newton-Raphson.txt', W);
  
  Y_pred_train = X_train*W;
  Y_pred_test = X_test*W;
  
  [NR_e_log_train, NR_e_log_test, NR_e_01_train, NR_e_01_test] = errors(Y_train, Y_test, Y_pred_train, Y_pred_test);
  
  f = figure();
  hist(W);
  title('Histogram wag - Newton-Raphson');
  saveas(f, 'results/histogram_Newton-Raphson.png');
  
  # SGD
  tic
  [W, W_epoch] = SGD(X_train, Y_train);
  toc
  csvwrite('results/W_SGD.txt', W);

  Y_pred_train = X_train*W;
  Y_pred_test = X_test*W; 
  errors(Y_train, Y_test, Y_pred_train, Y_pred_test)
  epoch_error(Y_train, Y_test, Y_pred_train, Y_pred_test, W, W_epoch, X_train, NR_e_log_train, NR_e_01_train);

  f = figure();
  hist(W);
  title('Histogram wag - stochastyczny spadek wzdluz gradientu');
  saveas(f, 'results/histogram_SGD.png');
  
 end
