A=[3 -6 26 ;4 -8 -7;0 4 4;0 -3 -3];
b=[1 1 1 1];
[u,s,v]=svd(A);
%y=v'*x;
b_hat=u'*b';
y=s\b_hat;
x=v*y;
disp(x);
disp(norm(b-A*x));

