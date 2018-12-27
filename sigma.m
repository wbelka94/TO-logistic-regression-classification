function [B] = sigma(X, Y, W)
  B = diag(1./(1+e.^(Y.*(X*W))));
end