function [Q, R] = QR_householder_reflection(A)
    n = size(A, 1);
    R = A;
    Q = eye(n);

    for i = 1:n-1
        u = R(i:end, i);

        v = zeros(length(u), 1);
        v(1) = norm(u)*sign(u(1));

        x = u+v;
        x = x/norm(x);

        R(i:end,i:end) = R(i:end,i:end) - 2*x*(x'*R(i:end,i:end));
        Q(:,i:end) = Q(:,i:end) - 2*(Q(:,i:end)*x)*x';
        
    end
end
