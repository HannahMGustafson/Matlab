function R2 = Rsquared_nofig(X, Y)

% Calculate the coefficient of determination
diffx = X-mean(X);
diffy = Y-mean(Y);
num = diffx.*diffy;
X2 = diffx.^2;
Y2 = diffy.^2;
den = sqrt(sum(X2)*sum(Y2));
R2 = (sum(num)/den)^2;

