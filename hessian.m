function [H] = hessian(B, X)
  n = size(X, 1);
  H = X'*B*(eye(n)-B)*X;
  if(cond(H) == Inf)
    H = l*eye(m) + X'*B*(eye(n)-B)*X;
  else    
    H = X'*B*(eye(n)-B)*X;
  end
end