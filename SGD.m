function [W, W_epoch] = SGD(X, Y, step=0.05)  n = size(X, 1);    rp = randperm(n);   Yst = Y(rp);   Xst = X(rp, :);    m = size(Xst, 2);  W = zeros(m, 1);  W_epoch = [];  w = 10;    for epoch=1:100    for i = 1:n      W = W + (step/sqrt(i+(epoch-1)*n))*(Yst(i)/(1 + exp(Yst(i)*Xst(i,:)*W)))*Xst(i,:)';    end    if(norm(W) > w)      W = (W/norm(W))*w;    end    W_epoch = [W_epoch, W];  end    end