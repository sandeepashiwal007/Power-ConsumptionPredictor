clc;
clear all;
x=[1,2,3,5,6,7];
y=[2,4,6,8,10,12];
n=length(x);
plot(x,y,'r*:');
A0=0;
x1=0.120;
x2=-0.110;

ERR=1;
EPSILON=0.001;

while (ERR>EPSILON)
F1=sum(x.*(exp(x1*x)))-sum(y.*(exp(x1*x)))*sum(x.*(exp(2*x1*x)))/sum(y.*(exp(2*x1*x)));
x3=(x1+x2)/2;

f2=sum(x.*(exp(x3*x)))-sum(y.*(exp(x3*x)))*sum(x.*(exp(2*x3*x)))/sum(y.*(exp(2*x3*x)));



ERR=abs(f2);

if (F1*f2<0)
    x2=x3;
else
    x1=x3;
    
    
end
A0=A0+1;

end

A=sum(y.*(exp(x3*x)))/sum(exp(2*x3*x));
Y=A*exp(x3*x);
%plot(x,Y,'b*:');




