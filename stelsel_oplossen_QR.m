n=10;
b=ones(1,n);

H = zeros(n,n);
for i=1:n
    for j=1:n
        H(i,j) = 1/(i+j-1);
    end
end

[Q1, R1] = QR_gramm_schmidt(H);
[Q2, R2] = QR_givens_rotation(H);
[Q3, R3] = QR_householder_reflection(H);

QTb1 = zeros(1,n);
QTb2 = zeros(1,n);
QTb3 = zeros(1,n);

for k=1:n
    QTb1(k) = sum(Q1(:,k));
    QTb2(k) = sum(Q2(:,k));
    QTb3(k) = sum(Q3(:,k));
end

x1 = backSub(R1, QTb1);
x2 = backSub(R2, QTb2);
x3 = backSub(R3, QTb3);

X = [x1,x2,x3]