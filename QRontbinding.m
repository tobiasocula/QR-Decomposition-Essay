function [Q,R]=QRontbinding(A)

n=length(A(:,1));
R=zeros(n);
Q=R;
R(1,1)=sqrt(A(:,1)'*A(:,1));
Q(:,1)=A(:,1)/R(1,1);

for j=2:n
    R(1:j-1,j)=Q(:,1:j-1)'*A(:,j);
    Q(:,j)=A(:,j)-Q(:,1:j-1)*R(1:j-1,j);
    R(j,j)=sqrt(Q(:,j)'*Q(:,j));
    Q(:,j)=Q(:,j)/R(j,j);
end
end