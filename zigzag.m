function[new]=zigzag(im)
t=0;
l=size(im);
sum=l(2)*l(1);  %calculating the M*N
for d=2:sum
 c=rem(d,2);  %checking whether even or odd
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==d)
                t=t+1;
                if(c==0)
                new(t)=im(j,d-j);
                else          
                new(t)=im(d-j,j);
                end
             end    
         end
     end
end
end