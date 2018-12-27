function [W] = NewtonRaphson(X, Y)
  n = size(X, 1);
  m = size(X, 2);
  W = zeros(m, 1);
  
  B = sigma(X,Y,W);
  H = hessian(B,X);
  l = 10^(-5);
  grad = gradient(X, Y, W, B, H, l);
  
  iteration = 0;
  
  while(norm(grad) > 10^(-8))
    W = W - H^(-1)*grad;    
    B = sigma(X,Y,W);
    H = hessian(B,X);
    grad = gradient(X, Y, W, B, H, l);
    iteration = iteration + 1;
  end
  iteration
end