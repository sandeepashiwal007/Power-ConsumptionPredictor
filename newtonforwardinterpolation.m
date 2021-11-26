clear all;
clc;
X=[10 20 30 40 50];
Y=[100 200 300 400 500];
x=20;
c=size(X);
h=X(2)-X(1);
A=[];
y=Y(1,1);
%for first column
for i=1:1:c(1,1)
    A(i,1)=Y(i);
end
%for rest of the entries
for i=2:1:c(1,1)
    for j=2:1:i
        A(i,j)=A(i,j-1)-A(i-1,j-1);
    end
end
%for evaluating the value of function at given point
p=(x-X(1))/h;
for i=2:1:c(1,1)
    L(i)=1;
    for j=1:1:i-1
       L(i)=(L(i))*(x-X(j));
   end
   y=y+((A(i,i))*L(i))/(((h)^(i-1))*factorial(i-1));
end
for i=2:1:c(1,1)
    L(i)=1;
    for j=1:1:i-1
       L(i)=(L(i))*(p-j+1);
    end
    y=y+((A(i,i))*L(i))/(factorial(i-1));
end
y