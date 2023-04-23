function [est_weights] = LMS(y_t, x, model)
    [a,b] = size(x)
    w = zeros(1,b)
    d=y_t
    mu = 0.1
    for n=1:length(y_t)
            e(n) = d(n) - w * x(n,:)';
            w = w + mu * e(n) * x(n,:);
            est_weights(:,n)=w;
    end
