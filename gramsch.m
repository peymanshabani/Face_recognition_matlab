%Gram-Schmidt orthogonalization method
function V=gramsch(A)
[m,n]=size(A);
for k=1:n
    V(:,k)=A(:,k);
    for j=1:k-1
        V(:,k)=V(:,k)-(V(:,j)'*A(:,k))*V(:,j);
    end
    V(:,k)=V(:,k)/norm(V(:,k));
end
