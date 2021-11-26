clear all;
clc;
X=[10 20 30 40 50];
Y=[100 200 300 400 500];
x=17;
c=size(X);
n=c(1,1);
h=X(2)-X(1);
A=[];
y=Y(n,1);
%for first column
for i=1:1:n
    A(i,1)=Y(i);
end
%for rest of the entries
for i=2:1:n
    for j=2:1:i
        A(i,j)=A(i,j-1)-A(i-1,j-1);
    end
end
%for evaluating the value of function at given point
p=(x-X(n))/h;
for i=2:1:n
    L(i)=1;
    for j=1:1:i-1
       L(i)=(L(i))*(p+j-1);
    end
    y=y+((A(n,i))*L(i))/(factorial(i-1));
end