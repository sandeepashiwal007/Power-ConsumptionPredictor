clear all;
clc;
date=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84];
power=[21 34 43 54 45 54 62  22 39 49 54 47 51 68  23 37 46 50 41 56 67  24 36 48 57 46 53 65 20 34 43 54 45 54 62  22 39 49 54 47 51 68  24 37 46 50 41 56 67  21 36 48 57 46 53 65 23 34 43 54 45 54 62  22 39 49 54 47 51 68  24 37 46 50 41 56 67  21 36 48 57 46 53 65];
%date=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28];
%power=[23 34 43 54 45 54 62  27 39 49 54 47 51 68  28 37 46 50 41 56 67  21 36 48 57 46 53 65];
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
%Monday1=[1,2,3,4];
%Tuesday1=[5 6 7 8];
%Wednesday1=[9 10 11 12];
%Thursday1=[13 14 15 16];
%Friday1=[17 18 19 20];
%Saturday1=[21 22 23 24];
%Sunday1=[25 26 27 28];
SumMonday     =  SumCalci(Monday1,Monday2,n/7);
SumTuesday    =  SumCalci(Tuesday1,Tuesday2,n/7);
SumWednesday  =  SumCalci(Wednesday1,Wednesday2,n/7);
SumThursday  =  SumCalci(Thursday1,Thursday2,n/7);
SumFriday    =  SumCalci(Friday1,Friday2,n/7);
SumSaturday  =  SumCalci(Saturday1,Saturday2,n/7);
SumSunday    =  SumCalci(Sunday1,Sunday2,n/7);

WeekDate=[Monday1 Tuesday1 Wednesday1 Thursday1 Friday1 Saturday1 Sunday1];
N=length(WeekDate);
WeekDate3=SUM_Declassify(WeekDate,N);
WeekPower1=[Monday2 Tuesday2 Wednesday2 Thursday2 Friday2 Saturday2 Sunday2];
WeekPower2=[SumMonday SumTuesday SumWednesday SumThursday SumFriday SumSaturday SumSunday];
WeekPower3=SUM_Declassify(WeekPower1,N);
WeekPower4=SUM_Declassify(WeekPower2,N);
plot(WeekDate3,WeekPower3,'*:red');
%hold on
hold on
plot(WeekDate3,WeekPower4,'*:blue');
function [G]  =   SUM_Declassify(a1,a2)
G=zeros;   
       for i=1:a2
            if(mod(i,7)==1)
                G(int8(i/7)+1)=a1(i);
            else
                if(mod(i,7)==2)
                   G(int8(i/7)+1)=a1(i);
                else
                    if(mod(i,7)==3)
                        G(int8(i/7)+1)=a1(i);
                    else
                        if(mod(i,7)==4)
                            G(int8(i/7))=a1(i);
                        else
                            if(mod(i,7)==5)
                                G(int8(i/7))=a1(i);
                            else
                                if(mod(i,7)==6)
                                    G(int8(i/7))=a1(i);
                                else
                                    if(mod(i,7)==0)
                                        G(int8(i/7)+1)=a1(i);
                                     end
                                end
                            end
                        end
                    end
                end
            end   
       end
end
function [E]  =   SumCalci(a1,a2,a3)
            
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
            s7=s4+(a1(i)^2)*a2(i);
            end
            a=[a3,s1,s2;s1,s2,s3;s2,s3,s4];
            b=[s5;s6;s7];
            C=inv(a);
            D=C*b;
            E=D(1,1)+D(2,1)*a1+D(3,1)*a1.^2;
end