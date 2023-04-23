% function run_experiment_bc(varargin)
clc;
clear;

init;
task_type    = 'bc';
% dataset_name    = 'svmguide3';
dataset_name    = 'matlab5'; %   'matlab(UCI)'; 
% dataset_name    = 'ISCX'; %   'matlab(UCI)';
% dataset_name    = 'matlab2';
% dataset_name    = 'elecNormNew';
% dataset_name    = 'KDD';

file_format     = 'mat';
impl_lang      = 'm'; % matlab



load(sprintf('data/%s.mat',dataset_name));

% [n,d]=size(myISCX); xt = myISCX(:,1:d-1); y = myISCX(:,d);

% [n,d]=size(D_gc1); xt = D_gc1(:,1:d-1); y = D_gc1(:,d);

[n,d]=size(combine_legith_phish);
xt = combine_legith_phish(:,1:d-1);
y = combine_legith_phish(:,d);
%% ISCX
% [n,d]=size(myISCX); xt = myISCX(:,1:d-1); y = myISCX(:,d);

%% NSL-KDD-20 percent
% [n,d]=size(PercentTrainingSet); xt = PercentTrainingSet(:,1:d-1); y = PercentTrainingSet(:,d);

%% elecNormNew
% [n,d]=size(elecNormNew); xt = elecNormNew(:,1:d-1); y = elecNormNew(:,d);

%% Start for
x_All = xt;
y_All = y;
%% 
% data = eval(sprintf('Day%d', ii));

% data.data = mydata;
% data.labels = mylabel;
% x_All = data.data(:,[4:6 8 11 16:19 21:23 30 33 35 39 41 43 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83 85 87 89 91 93 95 97 99:101 103 105 107 109 111 113 120 126 132 134 136 138 140 142 144 146 148 150 161 194 270 7801]);
% y_All = data.labels;
% index_leg = find(y_All ==0);
% index_phish = find(y_All ==1);
% y_All(index_leg)=1;
% y_All(index_phish)=-1;
% 
% [n,d]=size(x_All);
%%

mysize=0;

ii=20;
MyFileName = ['result/myresult' num2str(ii)];
MyFileName = strcat(MyFileName,'.txt');
file = fopen(MyFileName ,'w');

MyFileName2 = ['result/IterationAccuracy' num2str(ii)];
MyFileName2 = strcat(MyFileName2,'.txt');
file2 = fopen(MyFileName2,'w');

MyFileName3 = ['result/IterationMeanSqure' num2str(ii)];
MyFileName3 = strcat(MyFileName3,'.txt');
file3 = fopen(MyFileName3,'w');

MyFileName4 = ['result/RMSE' num2str(ii)];
MyFileName4 = strcat(MyFileName4,'.txt');
file4 = fopen(MyFileName4,'w');

MyFileName5 = ['result/TPR' num2str(ii)];
MyFileName5 = strcat(MyFileName5,'.txt');
file5 = fopen(MyFileName5,'w');

MyFileName6 = ['result/TNR' num2str(ii)];
MyFileName6 = strcat(MyFileName6,'.txt');
file6 = fopen(MyFileName6,'w');

MyFileName11 = ['result/FSCORE' num2str(ii)];
MyFileName11 = strcat(MyFileName11,'.txt');
file11 = fopen(MyFileName11,'w');

MyFileName12 = ['result/MCC' num2str(ii)];
MyFileName12 = strcat(MyFileName12,'.txt');
file12 = fopen(MyFileName12,'w');

MyFileName13 = ['result/TP' num2str(ii)];
MyFileName13 = strcat(MyFileName13,'.txt');
file13 = fopen(MyFileName13,'w');

MyFileName14 = ['result/TN' num2str(ii)];
MyFileName14 = strcat(MyFileName14,'.txt');
file14 = fopen(MyFileName14,'w');

MyFileName15 = ['result/FN' num2str(ii)];
MyFileName15 = strcat(MyFileName15,'.txt');
file15 = fopen(MyFileName15,'w');

MyFileName16 = ['result/FP' num2str(ii)];
MyFileName16 = strcat(MyFileName16,'.txt');
file16 = fopen(MyFileName16,'w');


% file3 = fopen('IterationMeanSqure.txt','w');
my_All_input = [];
my_hate_Y_and_Y= [];
my_hate_ft_and_Y= [];
my_l_t= [];

for i=1:size(x_All,1),
    x_t = xt(i,:);
    y_t = y(i,:);
%% run experiments:
%rand('seed',0);
if (impl_lang == 'm'),    % matlab implementation
    options_Dr_Sadoghi  = init_options('Dr_Sadoghi',n,task_type);
    options_PE      = init_options('Perceptron',n,task_type);
    options_ROMMA   = init_options('ROMMA',n,task_type);
    options_aROMMA  = init_options('aROMMA',n,task_type);
    options_ALMA    = init_options('ALMA',n,task_type);
    options_OGD     = init_options('OGD',n,task_type);
    options_PA      = init_options('PA',n,task_type);
    options_PA1     = init_options('PA1',n,task_type);
    options_PA2     = init_options('PA2',n,task_type);
    options_SOP     = init_options('SOP',n,task_type);
    options_IELLIP  = init_options('IELLIP',n,task_type);
    options_CW      = init_options('CW',n,task_type);
    options_NHERD   = init_options('NHERD',n,task_type);
    options_AROW    = init_options('AROW',n,task_type);
    options_NAROW   = init_options('NAROW',n,task_type);
    options_SCW     = init_options('SCW',n,task_type);
    options_SCW2    = init_options('SCW2',n,task_type);

end    

model_PA.task_type=task_type;
model_PA1.task_type=task_type;
model_PA2.task_type=task_type;
model_Perceptron.task_type=task_type;
model_ROMMA.task_type=task_type;
model_aROMMA.task_type=task_type;
model_ALMA.task_type=task_type;
model_OGD.task_type=task_type;
model_SOP.task_type=task_type;
model_IELLIP.task_type=task_type;
model_CW.task_type=task_type;
model_NHERD.task_type=task_type;
model_AROW.task_type=task_type;
model_NAROW.task_type=task_type;
model_SCW.task_type=task_type;
model_SCW2.task_type=task_type;
model_Fusion.task_type=task_type;
d=size(xt,2);

%%
my_l_t_PA = [];
Eror.my_l_t_PA_error_number=[];

my_l_t_PA1 =[];
Eror.my_l_t_PA1_error_number=[];

my_l_t_PA2 =[];
Eror.my_l_t_PA2_error_number=[];

my_l_t_Perceptron =[];
Eror.my_l_t_Perceptron_error_number =[];

my_l_t_ROMMA =[];
Eror.my_l_t_ROMMA_error_number =[];

my_l_t_aROMMA =[];
Eror.my_l_t_aROMMA_error_number =[];

my_l_t_ALMA =[];
Eror.my_l_t_ALMA_error_number =[];

my_l_t_OGD =[];
Eror.my_l_t_OGD_error_number =[];

my_l_t_SOP =[];
Eror.my_l_t_SOP_error_number =[];

my_l_t_IELLIP =[];
Eror.my_l_t_IELLIP_error_number =[];

my_l_t_CW=[];
Eror.my_l_t_CW_error_number=[];

my_l_t_NHERD=[];
Eror.my_l_t_NHERD_error_number=[];

my_l_t_AROW=[];
Eror.my_l_t_AROW_error_number=[];

my_l_t_NAROW=[];
Eror.my_l_t_NAROW_error_number=[];

my_l_t_SCW=[];
Eror.my_l_t_SCW_error_number=[];

my_l_t_SCW2=[];
Eror.my_l_t_SCW2_error_number=[];

my_l_t_Fusion=[];
Eror.my_l_t_Fusion_error_number=[];
number = [];

x_new=[];

confusion_result.PA=[];
confusion_result.PA1 =[];
confusion_result.PA2 =[];
confusion_result.Perceptron =[];
confusion_result.ROMMA =[];
confusion_result.aROMMA =[];
confusion_result.ALMA =[];
confusion_result.OGD =[];
confusion_result.SOP =[];
confusion_result.IELLIP =[];
confusion_result.CW=[];
confusion_result.NHERD=[];
confusion_result.AROW=[];
confusion_result.NAROW=[];
confusion_result.SCW=[];
confusion_result.SCW2=[];

zero_one_loss_matris=[];

% for i=1:n,
%     number=[number i];
% end



    
    %% PA
    model_PA = My_init(options_PA, d, 'bc' ,model_PA ,i);
    [model_PA, PA_hat_y_t, l_t_PA, f_t_PA] = feval('PA', y_t, x_t, model_PA);
%     my_l_t_PA = [my_l_t_PA l_t_PA];

    confusion_result.PA = [confusion_result.PA1; y_t PA_hat_y_t];

    my_l_t_PA = [my_l_t_PA l_t_PA];
       
    if(l_t_PA>0)
        Eror.my_l_t_PA_error_number = [Eror.my_l_t_PA_error_number i];
    end
    
    %% PA1
     model_PA1 = My_init(options_PA1, d, 'bc', model_PA1,i);
    [model_PA1, PA1_hat_y_t, l_t_PA1, f_t_PA1] = feval('PA1', y_t, x_t, model_PA1);
%     my_l_t_PA1 =[my_l_t_PA1 l_t_PA1];

     confusion_result.PA1 = [confusion_result.PA1; y_t PA1_hat_y_t];
     
    my_l_t_PA1 =[my_l_t_PA1 l_t_PA1];
      
    if(l_t_PA1>0)
        Eror.my_l_t_PA1_error_number = [Eror.my_l_t_PA1_error_number i];
    end
    %% PA2
     model_PA2 = My_init(options_PA2, d, 'bc', model_PA2,i);
    [model_PA2, PA2_hat_y_t, l_t_PA2, f_t_PA2] = feval('PA2', y_t, x_t, model_PA2);
%     my_l_t_PA2 =[my_l_t_PA2 l_t_PA2];

    confusion_result.PA2 = [confusion_result.PA2; y_t PA2_hat_y_t];
    my_l_t_PA2 =[my_l_t_PA2 l_t_PA2];
    
    if(l_t_PA2>0)
        Eror.my_l_t_PA2_error_number = [Eror.my_l_t_PA2_error_number i];
    end

    %% Perceptron
     model_Perceptron = My_init(options_PE, d, 'bc',model_Perceptron,i);
    [model_Perceptron, Perceptron_hat_y_t, l_t_Perceptron, f_t_Perceptron] = feval('Perceptron', y_t, x_t, model_Perceptron);
%     my_l_t_Perceptron =[my_l_t_Perceptron l_t_Perceptron];

    confusion_result.Perceptron = [confusion_result.Perceptron; y_t Perceptron_hat_y_t];
    
    my_l_t_Perceptron =[my_l_t_Perceptron l_t_Perceptron];
       
    if(l_t_Perceptron>0)
        Eror.my_l_t_Perceptron_error_number = [Eror.my_l_t_Perceptron_error_number i];
    end

    %% ROMMA
     model_ROMMA = My_init(options_ROMMA, d, 'bc',model_ROMMA,i);
    [model_ROMMA, ROMMA_hat_y_t, l_t_ROMMA, f_t_ROMMA] = feval('ROMMA', y_t, x_t, model_ROMMA);
%     my_l_t_ROMMA =[my_l_t_ROMMA l_t_ROMMA];

    confusion_result.ROMMA = [confusion_result.ROMMA; y_t ROMMA_hat_y_t];
    
    my_l_t_ROMMA =[my_l_t_ROMMA l_t_ROMMA];
      
    if(l_t_ROMMA>0)
        Eror.my_l_t_ROMMA_error_number = [Eror.my_l_t_ROMMA_error_number i];
    end
    %% aROMMA    
     model_aROMMA = My_init(options_aROMMA, d, 'bc',model_aROMMA,i);
    [model_aROMMA, aROMMA_hat_y_t, l_t_aROMMA, f_t_aROMMA] = feval('aROMMA', y_t, x_t, model_aROMMA);
%     my_l_t_aROMMA =[my_l_t_aROMMA l_t_aROMMA];

    confusion_result.aROMMA = [confusion_result.aROMMA; y_t aROMMA_hat_y_t];
    
    my_l_t_aROMMA =[my_l_t_aROMMA l_t_aROMMA];
       
    if(l_t_aROMMA>0)
        Eror.my_l_t_aROMMA_error_number = [Eror.my_l_t_aROMMA_error_number i];
    end

    %% ALMA
     model_ALMA = My_init(options_ALMA, d, 'bc',model_ALMA,i);
    [model_ALMA, ALMA_hat_y_t, l_t_ALMA, f_t_ALMA] = feval('ALMA', y_t, x_t, model_ALMA);
%     my_l_t_ALMA =[my_l_t_ALMA l_t_ALMA];

    confusion_result.ALMA = [confusion_result.ALMA; y_t ALMA_hat_y_t];

    my_l_t_ALMA =[my_l_t_ALMA l_t_ALMA];
       
    if(l_t_ALMA>0)
        Eror.my_l_t_ALMA_error_number = [Eror.my_l_t_ALMA_error_number i];
    end
    %% OGD
      model_OGD = My_init(options_OGD, d, 'bc',model_OGD,i);
    [model_OGD, OGD_hat_y_t, l_t_OGD, f_t_OGD] = feval('OGD', y_t, x_t, model_OGD);
%     my_l_t_OGD =[my_l_t_OGD l_t_OGD];

    confusion_result.OGD = [confusion_result.OGD; y_t OGD_hat_y_t];

    my_l_t_OGD =[my_l_t_OGD l_t_OGD];
       
    if(l_t_OGD>0)
        Eror.my_l_t_OGD_error_number = [Eror.my_l_t_OGD_error_number i];
    end
    %% SOP
     model_SOP = My_init(options_SOP, d, 'bc',model_SOP,i);
    [model_SOP, SOP_hat_y_t, l_t_SOP, f_t_SOP] = feval('SOP', y_t, x_t, model_SOP);
%     my_l_t_SOP =[my_l_t_SOP l_t_SOP];

    confusion_result.SOP = [confusion_result.SOP; y_t SOP_hat_y_t];
    
    my_l_t_SOP =[my_l_t_SOP l_t_SOP];
        
    if(l_t_SOP>0)
        Eror.my_l_t_SOP_error_number = [Eror.my_l_t_SOP_error_number i];
    end
    %% IELLIP
     model_IELLIP = My_init(options_IELLIP, d, 'bc',model_IELLIP,i);
    [model_IELLIP,IELLIP_hat_y_t, l_t_IELLIP, f_t_IELLIP] = feval('IELLIP', y_t, x_t, model_IELLIP);
%     my_l_t_IELLIP =[my_l_t_IELLIP l_t_IELLIP];

    confusion_result.IELLIP = [confusion_result.IELLIP; y_t IELLIP_hat_y_t];

    my_l_t_IELLIP =[my_l_t_IELLIP l_t_IELLIP];
        
    if(l_t_IELLIP>0)
        Eror.my_l_t_IELLIP_error_number = [Eror.my_l_t_IELLIP_error_number i];
    end

    %% CW
     model_CW = My_init(options_CW, d, 'bc', model_CW,i);
    [model_CW, CW_hat_y_t, l_t_CW, f_t_CW] = feval('CW', y_t, x_t, model_CW);
%     my_l_t_CW=[my_l_t_CW l_t_CW];

    confusion_result.CW = [confusion_result.CW; y_t CW_hat_y_t];

    my_l_t_CW=[my_l_t_CW l_t_CW];
      
    if(l_t_CW>0)
        Eror.my_l_t_CW_error_number = [ Eror.my_l_t_CW_error_number i];
    end


    %% NHERD
     model_NHERD = My_init(options_NHERD, d, 'bc',model_NHERD,i);
    [model_NHERD, NHERD_hat_y_t, l_t_NHERD, f_t_NHERD] = feval('NHERD', y_t, x_t, model_NHERD);
%     my_l_t_NHERD=[my_l_t_NHERD l_t_NHERD];

    confusion_result.NHERD = [confusion_result.NHERD; y_t NHERD_hat_y_t];

    my_l_t_NHERD=[my_l_t_NHERD l_t_NHERD];
    
    if(l_t_NHERD>0)
        Eror.my_l_t_NHERD_error_number = [Eror.my_l_t_NHERD_error_number i];
    end
    %% AROW
     model_AROW = My_init(options_AROW, d, 'bc',model_AROW,i);
    [model_AROW, AROW_hat_y_t, l_t_AROW, f_t_AROW] = feval('AROW', y_t, x_t, model_AROW);
%     my_l_t_AROW=[my_l_t_AROW l_t_AROW];

    confusion_result.AROW = [confusion_result.AROW; y_t AROW_hat_y_t];

    my_l_t_AROW=[my_l_t_AROW l_t_AROW];
      
    if(l_t_AROW>0)
        Eror.my_l_t_AROW_error_number = [Eror.my_l_t_AROW_error_number i];
    end
    %% NAROW
     model_NAROW = My_init(options_NAROW, d, 'bc',model_NAROW,i);
    [model_NAROW, NAROW_hat_y_t, l_t_NAROW, f_t_NAROW] = feval('NAROW', y_t, x_t, model_NAROW);
%     my_l_t_NAROW=[my_l_t_NAROW l_t_NAROW];

    confusion_result.NAROW = [confusion_result.NAROW; y_t NAROW_hat_y_t];

    my_l_t_NAROW=[my_l_t_NAROW l_t_NAROW];
      
    if(l_t_NAROW>0)
        Eror.my_l_t_NAROW_error_number = [Eror.my_l_t_NAROW_error_number i];
    end
    %% SCW
     model_SCW = My_init(options_SCW, d, 'bc',model_SCW,i);
    [model_SCW, SCW_hat_y_t, l_t_SCW, f_t_SCW] = feval('SCW', y_t, x_t, model_SCW);
%     my_l_t_SCW=[my_l_t_SCW l_t_SCW];

    confusion_result.SCW = [confusion_result.SCW; y_t SCW_hat_y_t];

    my_l_t_SCW=[my_l_t_SCW l_t_SCW];
    
    if(l_t_SCW>0)
        Eror.my_l_t_SCW_error_number = [Eror.my_l_t_SCW_error_number i];
    end
    %% SCW-II
     model_SCW2 = My_init(options_SCW2, d, 'bc',model_SCW2,i);
    [model_SCW2, SCW2_hat_y_t, l_t_SCW2, f_t_SCW2] = feval('SCW2', y_t, x_t, model_SCW2);
%     my_l_t_SCW2=[my_l_t_SCW2 l_t_SCW2];

    confusion_result.SCW2 = [confusion_result.SCW2; y_t SCW2_hat_y_t];
    
    my_l_t_SCW2=[my_l_t_SCW2 l_t_SCW2];
    
    if(l_t_SCW2>0)
        Eror.my_l_t_SCW2_error_number = [Eror.my_l_t_SCW2_error_number i];
    end
  %%  
    
    
    
    
    
    
    
    %% new input
    x_new=[x_new;f_t_PA,f_t_PA1,f_t_PA2,f_t_Perceptron,f_t_ROMMA,f_t_aROMMA,f_t_ALMA,f_t_OGD,f_t_SOP,f_t_IELLIP,f_t_CW,f_t_NHERD,f_t_AROW,f_t_NAROW,f_t_SCW,f_t_SCW2];
   

    

%%  our all new input data
    x=[];
    x=[f_t_PA,f_t_PA1,f_t_PA2,f_t_Perceptron,f_t_ROMMA,f_t_aROMMA,f_t_ALMA,f_t_OGD,f_t_SOP,f_t_IELLIP,f_t_CW,f_t_NHERD,f_t_AROW,f_t_NAROW,f_t_SCW,f_t_SCW2];
    my_All_input = [my_All_input;x];
%%  our all hat_y_t 
    x2=[];
    x2=[PA_hat_y_t,PA1_hat_y_t,PA2_hat_y_t,Perceptron_hat_y_t,ROMMA_hat_y_t,aROMMA_hat_y_t,ALMA_hat_y_t,OGD_hat_y_t,SOP_hat_y_t,IELLIP_hat_y_t,CW_hat_y_t,NHERD_hat_y_t,AROW_hat_y_t,NAROW_hat_y_t,SCW_hat_y_t,SCW2_hat_y_t];
    my_hate_Y_and_Y =  [my_hate_Y_and_Y;x2];
%%  our all ft_hat_y_t
    x3=[];
    x3 = [f_t_PA,f_t_PA1,f_t_PA2,f_t_Perceptron,f_t_ROMMA,f_t_aROMMA,f_t_ALMA,f_t_OGD,f_t_SOP,f_t_IELLIP,f_t_CW,f_t_NHERD,f_t_AROW,f_t_NAROW,f_t_SCW,f_t_SCW2];
    my_hate_ft_and_Y = [my_hate_ft_and_Y;x3];
   %%  our LT
    x4=[];
    x4 = [l_t_PA,l_t_PA1,l_t_PA2,l_t_Perceptron,l_t_ROMMA,l_t_aROMMA,l_t_ALMA,l_t_OGD,l_t_SOP,l_t_IELLIP,l_t_CW,l_t_NHERD,l_t_AROW,l_t_NAROW,l_t_SCW,l_t_SCW2];
    %my_l_t = [my_l_t;l_t_Fusion];
    my_l_t = [my_l_t;x4];
    %% zero one Loss  =  if hate_y == label => 0  else 1
    my_zero_one_Loss;
    zero_one_loss_matris = [zero_one_loss_matris;x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16];
    

index = [];



%% Validation


% [TPR.PA, TNR.PA , Accuracy.PA, FSCORE.PA , MCC.PA , TP.PA,TN.PA,FN.PA,FP.PA] = my_validation(confusion_result.PA , sizeOfValidation , mysize);
% [TPR.PA1, TNR.PA1 , Accuracy.PA1 , FSCORE.PA1 , MCC.PA1 , TP.PA1,TN.PA1,FN.PA1,FP.PA1] = my_validation(confusion_result.PA1 , sizeOfValidation , mysize);
% [TPR.PA2, TNR.PA2 , Accuracy.PA2 , FSCORE.PA2 , MCC.PA2 , TP.PA2,TN.PA2,FN.PA2,FP.PA2] = my_validation(confusion_result.PA2 , sizeOfValidation , mysize);
% [TPR.Perceptron, TNR.Perceptron , Accuracy.Perceptron , FSCORE.Perceptron , MCC.Perceptron , TP.Perceptron,TN.Perceptron,FN.Perceptron,FP.Perceptron] = my_validation(confusion_result.Perceptron , sizeOfValidation , mysize);
% [TPR.ROMMA, TNR.ROMMA , Accuracy.ROMMA , FSCORE.ROMMA , MCC.ROMMA , TP.ROMMA,TN.ROMMA,FN.ROMMA,FP.ROMMA] = my_validation(confusion_result.ROMMA , sizeOfValidation , mysize);
% [TPR.aROMMA, TNR.aROMMA , Accuracy.aROMMA , FSCORE.aROMMA , MCC.aROMMA , TP.aROMMA,TN.aROMMA,FN.aROMMA,FP.aROMMA] = my_validation(confusion_result.aROMMA , sizeOfValidation , mysize);
% [TPR.ALMA, TNR.ALMA , Accuracy.ALMA , FSCORE.ALMA , MCC.ALMA , TP.ALMA,TN.ALMA,FN.ALMA,FP.ALMA] = my_validation(confusion_result.ALMA , sizeOfValidation , mysize);
% [TPR.OGD, TNR.OGD , Accuracy.OGD , FSCORE.OGD , MCC.OGD , TP.OGD,TN.OGD,FN.OGD,FP.OGD] = my_validation(confusion_result.OGD , sizeOfValidation , mysize);
% [TPR.SOP, TNR.SOP , Accuracy.SOP , FSCORE.SOP , MCC.SOP , TP.SOP,TN.SOP,FN.SOP,FP.SOP] = my_validation(confusion_result.SOP , sizeOfValidation , mysize);
% [TPR.IELLIP, TNR.IELLIP , Accuracy.IELLIP , FSCORE.IELLIP , MCC.IELLIP , TP.IELLIP,TN.IELLIP,FN.IELLIP,FP.IELLIP] = my_validation(confusion_result.IELLIP , sizeOfValidation , mysize);
% [TPR.CW, TNR.CW , Accuracy.CW , FSCORE.CW , MCC.CW , TP.CW,TN.CW,FN.CW,FP.CW] = my_validation(confusion_result.CW , sizeOfValidation , mysize);
% [TPR.NHERD, TNR.NHERD , Accuracy.NHERD , FSCORE.NHERD , MCC.NHERD , TP.NHERD,TN.NHERD,FN.NHERD,FP.NHERD] = my_validation(confusion_result.NHERD , sizeOfValidation , mysize);
% [TPR.AROW, TNR.AROW , Accuracy.AROW , FSCORE.AROW , MCC.AROW , TP.AROW,TN.AROW,FN.AROW,FP.AROW] = my_validation(confusion_result.AROW , sizeOfValidation , mysize);
% [TPR.NAROW, TNR.NAROW , Accuracy.NAROW , FSCORE.NAROW , MCC.NAROW , TP.NAROW,TN.NAROW,FN.NAROW,FP.NAROW] = my_validation(confusion_result.NAROW , sizeOfValidation , mysize);
% [TPR.SCW, TNR.SCW , Accuracy.SCW , FSCORE.SCW , MCC.SCW, TP.SCW,TN.SCW,FN.SCW,FP.SCW] = my_validation(confusion_result.SCW , sizeOfValidation , mysize);
% [TPR.SCW2, TNR.SCW2 , Accuracy.SCW2 , FSCORE.SCW2 , MCC.SCW2 , TP.SCW2,TN.SCW2,FN.SCW2,FP.SCW2] = my_validation(confusion_result.SCW2 , sizeOfValidation , mysize);

end

%% 
%% algorithm 2 (LMS)
    [est_weights] = feval('LMS', y, my_hate_Y_and_Y, model_PA1);
     LMSResult= est_weights';
    [f_t_weights] = feval('LMS', y, my_All_input, model_PA1);
     f_t_LMSResult= f_t_weights';
    [l_t_weights] = feval('LMS', y, my_l_t, model_PA1);
     l_t_LMSResult= l_t_weights';
%% Porposed algorithm 1 
% MyError=my_l_t(:,1:16);
MyError=zero_one_loss_matris;
cov1=cov(MyError);
% Ww=pinv(cov1)*ones(16,1)*(ones(1,16)*pinv(cov1)*ones(16,1))^-1;

% x = diag(cov1);
var_zero_one_loss = var(my_l_t,1);
var_LMS = var(LMSResult,1);
varCombiner = [var_zero_one_loss;var_LMS]

%%
% new = new ([1:10 12:16]);
%%

new1 = 1./var_zero_one_loss;
mysum1 = sum(new1);
Ww1 = new1./mysum1;

new2 = 1./var_LMS;
mysum2 = sum(new2);
Ww2 = new2./mysum2;



% Ww1 = Ww;
% Ww=Ww([1:10 12:16]);
% --------------------------------    -------------------------------------

% a=[var(my_l_t,0,1)]';
% threshold = find(a>=2);
% for i=1:size(threshold,1)
%     number = threshold(i);
%     Ww(number) = 0;
% end


    %% Dr sadoghi Report
%%    
% my_All_input = my_All_input(:,[1:10 12:16]);
%%
d = size(x_new,2);
model_Fusion = My_init(options_Dr_Sadoghi, d, 'bc',model_Fusion,i);
[result_ourwork1] = feval('Dr_Sadoghi', y, my_All_input, model_Fusion,Ww1);
PredictLabel1 = my_plot(result_ourwork1,y,1);

% confusion_result.ourwrk = myresult;
% [TPR.ourWork, TNR.ourWork , Accuracy.ourWork ,FSCORE.ourWork , MCC.ourWork, TP.ourWork,TN.ourWork,FN.ourWork,FP.ourWork] = my_validation(confusion_result.ourwrk , sizeOfValidation , mysize);
%%
d = size(x_new,3);
model_Fusion = My_init(options_Dr_Sadoghi, d, 'bc',model_Fusion,i);
[result_ourwork2] = feval('Dr_Sadoghi', y, my_All_input, model_Fusion,Ww2);
PredictLabel2 = my_plot(result_ourwork2,y,2);

% confusion_result.ourwrk = myresult;
% [TPR.ourWork, TNR.ourWork , Accuracy.ourWork ,FSCORE.ourWork , MCC.ourWork, TP.ourWork,TN.ourWork,FN.ourWork,FP.ourWork] = my_validation(confusion_result.ourwrk , sizeOfValidation , mysize);
%%
d = size(x_new,2);
model_Fusion = My_init(options_Dr_Sadoghi, d, 'bc',model_Fusion,i);
[result_ourwork3] = feval('Dr_Sadoghi', y, my_All_input, model_Fusion,LMSResult(end,:));
PredictLabel3 = my_plot(result_ourwork3,y,3);

% confusion_result.ourwrk = myresult;
% [TPR.ourWork, TNR.ourWork , Accuracy.ourWork ,FSCORE.ourWork , MCC.ourWork, TP.ourWork,TN.ourWork,FN.ourWork,FP.ourWork] = my_validation(confusion_result.ourwrk , sizeOfValidation , mysize);
%% predict cov(Zerooneloss),cov(lms),lms
prediction = [y,PredictLabel1',PredictLabel2',PredictLabel3']
%%    calculate Error
[Mean.PA, Error.PA , SquaredError.PA , MeanSquaredError.PA , RMSE.PA] = calculateError(my_l_t(:,1));
[Mean.PA1, Error.PA1 , SquaredError.PA1 , MeanSquaredError.PA1 , RMSE.PA1] = calculateError(my_l_t(:,2));
[Mean.PA2, Error.PA2 , SquaredError.PA2 , MeanSquaredError.PA2 , RMSE.PA2] = calculateError(my_l_t(:,3));
[Mean.Perceptron, Error.Perceptron , SquaredError.Perceptron , MeanSquaredError.Perceptron , RMSE.Perceptron] = calculateError(my_l_t(:,4));
[Mean.ROMMA, Error.ROMMA , SquaredError.ROMMA , MeanSquaredError.ROMMA , RMSE.ROMMA] = calculateError(my_l_t(:,5));
[Mean.aROMMA, Error.aROMMA , SquaredError.aROMMA , MeanSquaredError.aROMMA , RMSE.aROMMA] = calculateError(my_l_t(:,6));
[Mean.ALMA, Error.ALMA , SquaredError.ALMA , MeanSquaredError.ALMA , RMSE.ALMA] = calculateError(my_l_t(:,7));
[Mean.OGD, Error.OGD , SquaredError.OGD , MeanSquaredError.OGD , RMSE.OGD] = calculateError(my_l_t(:,8));
[Mean.SOP, Error.SOP , SquaredError.SOP , MeanSquaredError.SOP , RMSE.SOP] = calculateError(my_l_t(:,9));
[Mean.IELLIP, Error.IELLIP , SquaredError.IELLIP , MeanSquaredError.IELLIP , RMSE.IELLIP] = calculateError(my_l_t(:,10));
[Mean.CW, Error.CW , SquaredError.CW , MeanSquaredError.CW , RMSE.CW] = calculateError(my_l_t(:,11));
[Mean.NHERD, Error.NHERD , SquaredError.NHERD , MeanSquaredError.NHERD , RMSE.NHERD] = calculateError(my_l_t(:,12));
[Mean.AROW, Error.AROW , SquaredError.AROW , MeanSquaredError.AROW , RMSE.AROW] = calculateError(my_l_t(:,13));
[Mean.NAROW, Error.NAROW , SquaredError.NAROW , MeanSquaredError.NAROW , RMSE.NAROW] = calculateError(my_l_t(:,14));
[Mean.SCW, Error.SCW , SquaredError.SCW , MeanSquaredError.SCW , RMSE.SCW] = calculateError(my_l_t(:,15));
[Mean.SCW2, Error.SCW2 , SquaredError.SCW2 , MeanSquaredError.SCW2 , RMSE.SCW2] = calculateError(my_l_t(:,16));
[Mean.OurWork, Error.ourWork , SquaredError.ourWork , MeanSquaredError.ourWork , RMSE.ourWork] = calculateError(result_ourwork );

qq2 = var(result_ourwork);

% fprintf('Accuracy:  PA=%.3f\t PA1=%.3f\t PA2=%.3f\t Perceptron=%.3f\t ROMMA=%.3f\t aROMMA=%.3f\t ALMA=%.3f\t OGD=%.3f\t SOP=%.3f\t IELLIP=%.3f\t CW=%.3f\t NHERD=%.3f\t AROW=%.3f\t NAROW=%.3f\t SCW=%.3f\t SCW2=%.3f\t ourWork=%.3f\t',Accuracy.PA,Accuracy.PA1,Accuracy.PA2,Accuracy.Perceptron,Accuracy.ROMMA,Accuracy.aROMMA,Accuracy.ALMA,Accuracy.OGD,Accuracy.SOP,Accuracy.IELLIP,Accuracy.CW,Accuracy.NHERD,Accuracy.AROW,Accuracy.NAROW,Accuracy.SCW,Accuracy.SCW2,Accuracy.ourWork)
if(NumberIteration==101)
    fprintf(file,'\t\t\t PA\t PA1\t PA2\t Percept\t ROMMA\t aROMMA\t ALMA\t OGD\t SOP\t IELLIP\t CW\t NHERD\t AROW\t NAROW\t SCW\t SCW2\t ourWork\t\n')
end
fprintf(file,'\t%.3f\n',NumberIteration);
fprintf(file,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',Accuracy.PA,Accuracy.PA1,Accuracy.PA2,Accuracy.Perceptron,Accuracy.ROMMA,Accuracy.aROMMA,Accuracy.ALMA,Accuracy.OGD,Accuracy.SOP,Accuracy.IELLIP,Accuracy.CW,Accuracy.NHERD,Accuracy.AROW,Accuracy.NAROW,Accuracy.SCW,Accuracy.SCW2,Accuracy.ourWork)
fprintf(file5,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',TPR.PA,TPR.PA1,TPR.PA2,TPR.Perceptron,TPR.ROMMA,TPR.aROMMA,TPR.ALMA,TPR.OGD,TPR.SOP,TPR.IELLIP,TPR.CW,TPR.NHERD,TPR.AROW,TPR.NAROW,TPR.SCW,TPR.SCW2,TPR.ourWork)
fprintf(file6,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',TNR.PA,TNR.PA1,TNR.PA2,TNR.Perceptron,TNR.ROMMA,TNR.aROMMA,TNR.ALMA,TNR.OGD,TNR.SOP,TNR.IELLIP,TNR.CW,TNR.NHERD,TNR.AROW,TNR.NAROW,TNR.SCW,TNR.SCW2,TNR.ourWork)
fprintf(file2,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',Accuracy.PA,Accuracy.PA1,Accuracy.PA2,Accuracy.Perceptron,Accuracy.ROMMA,Accuracy.aROMMA,Accuracy.ALMA,Accuracy.OGD,Accuracy.SOP,Accuracy.IELLIP,Accuracy.CW,Accuracy.NHERD,Accuracy.AROW,Accuracy.NAROW,Accuracy.SCW,Accuracy.SCW2,Accuracy.ourWork)

fprintf(file11,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',FSCORE.PA,FSCORE.PA1,FSCORE.PA2,FSCORE.Perceptron,FSCORE.ROMMA,FSCORE.aROMMA,FSCORE.ALMA,FSCORE.OGD,FSCORE.SOP,FSCORE.IELLIP,FSCORE.CW,FSCORE.NHERD,FSCORE.AROW,FSCORE.NAROW,FSCORE.SCW,FSCORE.SCW2,FSCORE.ourWork)
fprintf(file12,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',MCC.PA,MCC.PA1,MCC.PA2,MCC.Perceptron,MCC.ROMMA,MCC.aROMMA,MCC.ALMA,MCC.OGD,MCC.SOP,MCC.IELLIP,MCC.CW,MCC.NHERD,MCC.AROW,MCC.NAROW,MCC.SCW,MCC.SCW2,MCC.ourWork)
fprintf(file13,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',TP.PA,TP.PA1,TP.PA2,TP.Perceptron,TP.ROMMA,TP.aROMMA,TP.ALMA,TP.OGD,TP.SOP,TP.IELLIP,TP.CW,TP.NHERD,TP.AROW,TP.NAROW,TP.SCW,TP.SCW2,TP.ourWork)
fprintf(file14,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',TN.PA,TN.PA1,TN.PA2,TN.Perceptron,TN.ROMMA,TN.aROMMA,TN.ALMA,TN.OGD,TN.SOP,TN.IELLIP,TN.CW,TN.NHERD,TN.AROW,TN.NAROW,TN.SCW,TN.SCW2,TN.ourWork)
fprintf(file15,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',FN.PA,FN.PA1,FN.PA2,FN.Perceptron,FN.ROMMA,FN.aROMMA,FN.ALMA,FN.OGD,FN.SOP,FN.IELLIP,FN.CW,FN.NHERD,FN.AROW,FN.NAROW,FN.SCW,FN.SCW2,FN.ourWork)
fprintf(file16,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',FP.PA,FP.PA1,FP.PA2,FP.Perceptron,FP.ROMMA,FP.aROMMA,FP.ALMA,FP.OGD,FP.SOP,FP.IELLIP,FP.CW,FP.NHERD,FP.AROW,FP.NAROW,FP.SCW,FP.SCW2,FP.ourWork)


fprintf(file,'\n');
fprintf(file2,'\n');
fprintf(file3,'\n');
fprintf(file4,'\n');
fprintf(file5,'\n');
fprintf(file6,'\n');

fprintf(file11,'\n');
fprintf(file12,'\n');
fprintf(file13,'\n');
fprintf(file14,'\n');
fprintf(file15,'\n');
fprintf(file16,'\n');

% fprintf('MeanSqureError:  PA\t PA1\t PA2\t Percept\t ROMMA\t aROMMA\t ALMA\t OGD\t SOP\t IELLIP\t CW\t NHERD\t AROW\t NAROW\t SCW\t SCW2\t ourWork\t\n')
fprintf(file,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',MeanSquaredError.PA,MeanSquaredError.PA1,MeanSquaredError.PA2,MeanSquaredError.Perceptron,MeanSquaredError.ROMMA,MeanSquaredError.aROMMA,MeanSquaredError.ALMA,MeanSquaredError.OGD,MeanSquaredError.SOP,MeanSquaredError.IELLIP,MeanSquaredError.CW,MeanSquaredError.NHERD,MeanSquaredError.AROW,MeanSquaredError.NAROW,MeanSquaredError.SCW,MeanSquaredError.SCW2,MeanSquaredError.ourWork)
fprintf(file3,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',MeanSquaredError.PA,MeanSquaredError.PA1,MeanSquaredError.PA2,MeanSquaredError.Perceptron,MeanSquaredError.ROMMA,MeanSquaredError.aROMMA,MeanSquaredError.ALMA,MeanSquaredError.OGD,MeanSquaredError.SOP,MeanSquaredError.IELLIP,MeanSquaredError.CW,MeanSquaredError.NHERD,MeanSquaredError.AROW,MeanSquaredError.NAROW,MeanSquaredError.SCW,MeanSquaredError.SCW2,MeanSquaredError.ourWork)
fprintf(file4,'\t\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t %.3f\t',RMSE.PA,RMSE.PA1,RMSE.PA2,RMSE.Perceptron,RMSE.ROMMA,RMSE.aROMMA,RMSE.ALMA,RMSE.OGD,RMSE.SOP,RMSE.IELLIP,RMSE.CW,RMSE.NHERD,RMSE.AROW,RMSE.NAROW,RMSE.SCW,RMSE.SCW2,RMSE.ourWork)

fprintf(file,'\n');
fprintf(file2,'\n');
fprintf(file3,'\n');
fprintf(file4,'\n');





%  figure(17)
% % subplot(3,1,1);
% plot(number, result_ourwork,'k.-');
% hold on;
% plot(number, my_Y ,'r.-');
% title('ourwork');
% 
% var(result_ourwork,0,1)
% edit svd
% end

%%  calculate variance of Lose function
variance = var(my_l_t,0,1);
variance = variance';

Standard_deviation = std(my_l_t,0,1);
Standard_deviation = Standard_deviation';


    





