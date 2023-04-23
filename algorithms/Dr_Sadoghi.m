function [result] = Dr_Sadoghi(y_t, x_t, model,Ww)
% Dr Sadoghi: a classical online learning algorithm 
n=size(x_t,1);
result=[];
for i=1:n
   z=x_t(i,:);
   result1=x_t(i,:)*Ww';
   result = [result;result1];
end


















% %%
% w     = model.w;
% %%  
% 
% hat_y_t =w*x_t' ;
% 
% er=y_t-hat_y_t;
% l_t = er;
% f_t = 1;
% Mu=0.01;
% 
% model.w=w+(Mu*er*x_t)%'/(my_input'*my_input);
