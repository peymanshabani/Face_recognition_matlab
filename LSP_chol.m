A=[3 -6 26;4 -8 -7;0 4 4;0 -3 -3];  
b=[1 1 1 1];
b=b';
A=0.2*A;
M=A'*A;
[t,p]=chol(M);
x=t\(t'\A'*b);
disp(x);

e=norm(A*x-b);
disp(e);

