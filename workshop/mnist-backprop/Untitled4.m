    labels=0*ones(1,200*7);
    count=0;
    for i=1:1400
        labels(i)=count;
        if(mod(i,7)==0)
            count=count+1;
        end
    end
    disp(labels);
