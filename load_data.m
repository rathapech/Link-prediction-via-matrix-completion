function [Adj] = load_data(data)

% Unweighted networks 
if data == 1 
    disp('Working with Jazz network ...');
    net = load('dataset/Jazz.txt');
    Adj = spones(form_net(net));    
        
elseif data == 2
    disp('Working with Yeast network ...');
    net = load('dataset/Yeast.txt');
    maxN = max(net(:,1));
    id = find(net(:,1) == 0);
    net(id,1) = maxN+1;
    
    id = find(net(:,2) == 0);
    net(id,2) = maxN+1;
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 3     
    disp('Working with Political Blog network ...');
    net = load('dataset/PoliticalBlogs.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 4     
    disp('Working with Hamster network ...');
    net = load('dataset/hamster.adj');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 5     
    disp('Working with Router network ...');
    net = load('dataset/Router.txt');
    maxN = max(net(:,1));
    id = find(net(:,1) == 0);
    net(id,1) = maxN+1;
    id = find(net(:,2) == 0);
    net(id,2) = maxN+1;
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 6     
    disp('Working with FWF network ...');
    net = load('dataset/foodwebs');
    net = net.foodwebs;
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 7     
    disp('Working with World trade network ...');
    net = load('dataset/world_trade.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 8     
    disp('Working with Contact network ...');
    net = load('dataset/contact.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 9     
    disp('Working with Metabolic network ...');
    net = load('dataset/metabolic.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 10     
    disp('Working with C.elegans dataset ...');
    net = load('dataset/Celegans');
    net = net.Celegans;
    maxN = max(net(:,1));
    id = find(net(:,1) == 0);
    net(id,1) = maxN+1;
    
    id = find(net(:,2) == 0);
    net(id,2) = maxN+1;
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
    
elseif data == 11     
    disp('Working with FWM network ...');
    net = load('dataset/mangwet.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net));  
 
elseif data == 12     
    disp('Working with Macaca network ...');
    net = load('dataset/macaque.adj');
    net(:,3) = 1; 
    Adj = spones(form_net(net)); 
    
elseif data == 13     
    disp('Working with Karate network ...');
    net = load('dataset/karate');
    net = sparse(net.karate);
    net(:,3) = 1; 
    Adj = spones(form_net(net)); 
    
elseif data == 14     
    disp('Working with Football network ...');
    net = load('dataset/football.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net)); 
    
elseif data == 15     
    disp('Working with Dolphin network ...');
    net = load('dataset/dolphins');
    net = sparse(net.dolphins);
    net(:,3) = 1; 
    Adj = spones(form_net(net)); 
    
elseif data == 16     
    disp('Working with Email network ...');
    net = load('dataset/erenas_email.txt');
    net(:,3) = 1; 
    Adj = spones(form_net(net)); 

% Weighting network =======================================    
elseif data == 17     
    disp('Working with USAir (weighted) network ...');
    net = load('dataset/USAir.txt');
    
    Adj = form_net(net);
    % Normalizing weigted
    t = 1 ./ (1+exp(-Adj));  
    tmp = spones(Adj);
    Adj = t .* tmp;
    
elseif data == 18     
    disp('Working with C.elegans (weighted) dataset ...');
    net = load('dataset/Celegans_w.txt');
    Adj = form_net(net);
    
elseif data == 19     
    disp('Working with FWE (weighted) dataset ...');
    net = load('dataset/gramwet.txt');
    
    Adj = form_net(net);
    % Normalizing weigted
    t = 1 ./ (1+exp(-Adj));
    tmp = spones(Adj);
    Adj = t .* tmp;
    
elseif data == 20     
    disp('Working with Football (weighted) dataset ...');
    net = load('dataset/football.txt');
    Adj = form_net(net);
    
    % Normalizing weigted
     t = 1 ./ (1+exp(-Adj));
     tmp = spones(Adj);
     Adj = t .* tmp;
    
else
    Adj = 0;
end



function Adj = form_net(data)

Adj = spconvert(data);
nodenum = length(Adj);
Adj(nodenum,nodenum) = 0;
Adj = (Adj + Adj');
Adj = Adj-diag(diag(Adj));


