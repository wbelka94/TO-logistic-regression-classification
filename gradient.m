function [grad] = gradient(X, Y, W, B, H, l)
  if(cond(H) == Inf)
    grad = l*W - X'*B*Y;
  else
    grad = (-1)*X'*B*Y;
  end
end