

% construeer Hilbertmatrix
for k=1:10
    n=5*k;
    H = zeros(n,n);
    for i=1:n
        for j=1:n
            H(i,j) = 1/(i+j-1);
        end
    end

    disp(['dimensie: ', num2str(n)])

    [Q, R] = QRontbinding(H);
    disp('norm H-QR (GS): ')
    disp(norm(H - Q*R))
    disp('norm QTQ-I (GS): ')
    disp(norm(Q'*Q-eye(n,n)))

    [Q, R] = QR_givens_rotation(H);
    disp('norm H-QR (GR): ')
    disp(norm(H - Q*R))
    disp('norm QTQ-I (GR): ')
    disp(norm(Q'*Q-eye(n,n)))

    [Q, R] = QR_householder_reflection(H);
    disp('norm H-QR (HR): ')
    disp(norm(H - Q*R))
    disp('norm QTQ-I (HR): ')
    disp(norm(Q'*Q-eye(n,n)))

    disp('\n')
    
end
