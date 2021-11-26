function [x1,x2] = SumCalci(a1,a2,a3)
            
            s1=0;
            s2=0;
            for i=1:a3
            s1=s1+a1(i);
            s2=s2+a2(i);
            end
            a=[a3,s1;s1,s2];
            b=inv(a);
            C=b*a3;
            x1=c(1);
            x2=c(2);
end