function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
theta_ = theta(2:end);

J = sum((X*theta - y).^2) + lambda*sum(theta_.^2);

J = J/(2*m);

[n,~] = size(theta);

grad(1) = sum((X*theta - y).*X(:,1));

for i=2:n
    grad(i) = sum((X*theta - y).*X(:,i)) + lambda*theta(i);
end

grad = grad/m;











% =========================================================================

grad = grad(:);

end
