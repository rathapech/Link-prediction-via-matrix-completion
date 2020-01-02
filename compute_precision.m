function correct_rate = compute_precision(scoreMat, test, train)

    probe_size = floor(nnz(test)./2);
    scoreMat = scoreMat.* ~train;   
    [row,col,weight]=find(tril(scoreMat,-1));
    [x,y]=sort(weight,'descend');
    %[x,y]=sort(weight);
    
    correct_rate=0;
    %for j= (length(y)-probe_size+1):length(y)
    for j= 1:probe_size
        if nnz(weight) == j 
            correct_rate=correct_rate/probe_size;
            return;
        else
            if test(row(y(j)),col(y(j)))>0
                correct_rate=correct_rate+1;
            end
        end
         
    end
correct_rate=correct_rate/probe_size;
