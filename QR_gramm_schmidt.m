function [Q,R] = QR_gramm_schmidt(A)
n=length(A(:,1));
R=zeros(n);
Q=R;
R(1,1)=sqrt(A(:,1)'*A(:,1));
Q(:,1)=A(:,1)/R(1,1);

for j=2:n
    dummy=Q(:,1:j-1)'*A(:,j);
    for i=1:2
        R(1:j-1,j)=Q(:,1:j-1)'*A(:,j);
        Q(:,j)=A(:,j)-Q(:,1:j-1)*R(1:j-1,j);
        A(:,j)=Q(:,j);
    end
    R(1:j-1,j)=dummy;
    R(j,j)=sqrt(Q(:,j)'*Q(:,j));
    Q(:,j)=Q(:,j)/R(j,j);
end