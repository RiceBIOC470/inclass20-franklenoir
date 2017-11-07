%Inclass 20

%In this folder you will find a .mat file with x and y data

load('data.mat');

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

fit_str = 'V*x/(K+x)';
fitmodel = fittype(fit_str,'problem',{'V'}); %unable to use multiple variables
[fit_out,fit_metric] = fit(xx(:),yy(:),fitmodel,'problem',3.75);

plot(fit_out,xx(:),yy(:))

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

fit_str = 'V*x^2/(K^2+x^2)';
fitmodel = fittype(fit_str,'problem',{'V'});
[fit_out,fit_metric] = fit(xx(:),yy(:),fitmodel,'problem',2.95);

plot(fit_out,xx(:),yy(:))


% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

fit_str = 'V*x^n/(K^n+x^n)';
fitmodel = fittype(fit_str,'problem',{'V','K'});
[fit_out,fit_metric] = fit(xx(:),yy(:),fitmodel,'problem',{5.25,5});

plot(fit_out,xx(:),yy(:))

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

fit_str = 'V*x^n/(K^n+x^n)';
fitmodel = fittype(fit_str,'problem',{'n'});
[fit_out,fit_metric] = fit(xx(:),yy(:),fitmodel,'problem',{1});

plot(fit_out,xx(:),yy(:))

%K = 2.304, V = 3.84 Much better

fit_str = 'V*x^n/(K^n+x^n)';
fitmodel = fittype(fit_str,'problem',{'n'});
[fit_out,fit_metric] = fit(xx(:),yy(:),fitmodel,'problem',{2});

plot(fit_out,xx(:),yy(:))

%K = 1.622, V = 3.033 Much better
