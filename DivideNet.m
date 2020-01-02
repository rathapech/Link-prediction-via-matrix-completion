function [ train test ] = DivideNet( net, ratioTrain)

    %hide the probe set
    
    [i,j,k]=find(tril(net));
    train = net;
    probe_size=ceil(nnz(net)* (1-ratioTrain)/2);
    
    for pp=1: probe_size
        rand_num=ceil(length(i)*rand(1));
        select_ID1=i(rand_num);
        select_ID2=j(rand_num);
        i(rand_num)=[];
        j(rand_num)=[];
        train(select_ID1,select_ID2)=0;
        train(select_ID2,select_ID1)=0;
    end
    
    test = net - train; 
   
end
