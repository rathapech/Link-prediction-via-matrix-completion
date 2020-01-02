# Link-prediction-via-matrix-completion
Link prediction via matrix completion (published in EPL, (2017): 38002)  

The source code is corresponding to an article 

Pech, Ratha, et al. "Link prediction via matrix completion." EPL (Europhysics Letters) 117.3 (2017): 38002.


In order to run the simulation, one needs to run the main.m. 

Two variables are needed to be input during running:
1) The network option, input the integer number from 1 to 20 to select a network to work in a time. 
2) The number of independent runs. 

To adjust the fraction of probe set, one needs to adjust the variable ratioTrain.

The lambda, the parameter of LR, is fixed in advanced in the code. 

When one changes the value of lambda, one should be careful such that if it is set too small, 
the recovered matrix will have very small entries or zero. Therefore, the prediction will be failed.

If it is set too large, LR does not perform well either. 

This problem is also discussed in the article. 
