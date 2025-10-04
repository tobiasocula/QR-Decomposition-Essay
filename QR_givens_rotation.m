function [Q,R] = QR_givens_rotation(A)
    n = size(A, 1);
    R = A;
    Q = eye(n);

    for i = 1:n-1
        for j = i+1:n
            vi = R(i,i);
            vj = R(j,i);

            r = hypot(vi, vj);
            c = vi / r;
            s = -vj / r;

            R_copy = R;
            Q_copy = Q;

            R(i,:) = R_copy(i,:)*c - R_copy(j,:)*s;
            R(j,:) = R_copy(i,:)*s + R_copy(j,:)*c;
            Q(:,i) = Q_copy(:,i)*c - Q_copy(:,j)*s;
            Q(:,j) = Q_copy(:,i)*s + Q_copy(:,j)*c;
        end
    end
end
