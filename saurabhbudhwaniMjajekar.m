clear all;
clc;
date=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84];
power=[22.1 24.1 23.3 22.1 25 34.3 38.1  21.6 25.2 23.5 21.9 25.6 33.5 38.5  22.3 25.3 24.1 21.5 25.3 34.9 37.5  22.5 25.1 24.2 22.4 25.2 34 37.4 21.9 24.9 23.9 22.6 25.6 34.6 37.5  21.7 25.8 23.7 21.5 24.3 35.1 37.9  22.9 25.3 23.5 22.3 24.8 35.3 37.7  22.5 24.2 23.8 22 24.7 34.4 37.8 22.2 24.7 24.35 22.4 25.3 34.6 38.3  21.4 24.5 24 22.2 25.4 34.8 38.4  21.7 25.6 23.4 22.5 25.3 34.9 37.6  21.9 25.1 23.125 21.8 25.3 34.4 37.8];
plot(date,power,'*:red');
n=length(date);
Monday1=zeros;
Monday2=zeros;
Tuesday1=zeros;
Tuesday2=zeros;
Wednesday1=zeros;
Wednesday2=zeros;
Thursday1=zeros;
Thursday2=zeros;
Friday1=zeros;
Friday2=zeros;
Saturday1=zeros;
Saturday2=zeros;
Sunday1=zeros;
Sunday2=zeros;
for i=1:n
    if(mod(i,7)==1)
        Monday1(int8(i/7)+1)=date(i);
        Monday2(int8(i/7)+1)=power(i);
    else
        if(mod(i,7)==2)
           Tuesday1(int8(i/7)+1)=date(i);
           Tuesday2(int8(i/7)+1)=power(i);
        else
                if(mod(i,7)==3)
                    Wednesday1(int8(i/7)+1)=date(i);
                    Wednesday2(int8(i/7)+1)=power(i);
                else
                    if(mod(i,7)==4)
                        Thursday1(int8(i/7))=date(i);
                        Thursday2(int8(i/7))=power(i);
                    else
                        if(mod(i,7)==5)
                            Friday1(int8(i/7))=date(i);
                            Friday2(int8(i/7))=power(i);
                        else
                               if(mod(i,7)==6)
                                    Saturday1(int8(i/7))=date(i);
                                    Saturday2(int8(i/7))=power(i);
                               else
                                         if(mod(i,7)==0)
                                             Sunday1(int8(i/7))=date(i);
                                         Sunday2(int8(i/7))=power(i);
                                     end
                               end
                        end
                    end
                end
         end
    end
end 
RootMonday    =  RootCalciLinear(Monday1,Monday2,n/7);
RootTuesday   =  RootCalciLinear(Tuesday1,Tuesday2,n/7);
RootWednesday =  RootCalciQuad(Wednesday1,Wednesday2,n/7);
RootThursday  =  RootCalciQuad(Thursday1,Thursday2,n/7);
RootFriday    =  RootCalciQuad(Friday1,Friday2,n/7);
RootSaturday  =  RootCalciLinear(Saturday1,Saturday2,n/7);
RootSunday    =  RootCalciQuad(Sunday1,Sunday2,n/7);

SumMonday     =  SumCalciQuad(Monday1,Monday2,n/7);
SumTuesday    =  SumCalciQuad(Tuesday1,Tuesday2,n/7);
SumWednesday  =  SumCalciQuad(Wednesday1,Wednesday2,n/7);
SumThursday   =  SumCalciQuad(Thursday1,Thursday2,n/7);
SumFriday     =  SumCalciQuad(Friday1,Friday2,n/7);
SumSaturday   =  SumCalciLinear(Saturday1,Saturday2,n/7);
SumSunday     =  SumCalciQuad(Sunday1,Sunday2,n/7);

%S1=SumCalciLinear1(Saturday1,Saturday2,n/7);
%S2=SumCalciLinear1(Sunday1,Sunday2,n/7);
plot(Saturday1,SumSaturday,'*:red');
hold on
plot(Saturday1,Saturday2,'*:blue');
hold on 
function [D]  =   RootCalciQuad(a1,a2,a3)
            
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            s5=0;
            s6=0;
            s7=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a1(i)^2;
            s3=s3+a1(i)^3;
            s4=s4+a1(i)^4;
            s5=s5+a2(i);
            s6=s6+a1(i)*a2(i);
            s7=s7+(a1(i)^2)*a2(i);
            end
            a=[a3,s1,s2;s1,s2,s3;s2,s3,s4];
            b=[s5;s6;s7];
            C=inv(a);
            D=C*b;
end
function [E]  =   SumCalciQuad(a1,a2,a3)
            
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            s5=0;
            s6=0;
            s7=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a1(i)^2;
            s3=s3+a1(i)^3;
            s4=s4+a1(i)^4;
            s5=s5+a2(i);
            s6=s6+a1(i)*a2(i);
            s7=s7+(a1(i)^2)*a2(i);
            end
            a=[a3,s1,s2;s1,s2,s3;s2,s3,s4];
            b=[s5;s6;s7];
            C=inv(a);
            D=C*b;
            E=D(1,1)+D(2,1)*a1+D(3,1)*a1.^2;
end

function [E]  =   SumCalciLinear(a1,a2,a3)
            
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a1(i)^2;
            s3=s3+a2(i);
            s4=s4+a1(i)*a2(i);
            end
            a=[a3,s1;s1,s2];
            b=[s3;s4];
            C=inv(a);
            D=C*b;
            E=D(1,1)+D(2,1)*a1;
end
function [D]  =   SumCalciLinear1(a1,a2,a3)
            
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a1(i)^2;
            s3=s3+a2(i);
            s4=s4+a1(i)*a2(i);
            end
            a=[a3,s1;s1,s2];
            b=[s3;s4];
            C=inv(a);
            D=C*b;
            E=[s1 s2 s3 s4];%D(1,1)+D(2,1)*a1;
end


function [D]  =   RootCalciLinear(a1,a2,a3)
            
            s1=0;
            s2=0;
            s3=0;
            s4=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a1(i)^2;
            s3=s3+a2(i);
            s4=s4+a1(i)*a2(i);
            end
            a=[a3,s1;s1,s2];
            b=[s3;s4];
            C=inv(a);
            D=C*b;
end