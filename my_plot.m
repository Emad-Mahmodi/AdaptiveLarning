function  PredictLabel = my_plot(result_ourwork, y, n)

%% plot 2 for classifire fusion figure
%%  our dataset
    legith = find(y ==1);
    phish = find(y ==-1);
    
    result_legith = result_ourwork(legith);
    result_phish = result_ourwork(phish);
    size_result_legith = size(result_legith,1);
    size_result_phish = size(result_phish,1);
    label_legith = ones(size_result_legith,1);
    label_phish = ones(size_result_phish,1);
    label_phish = label_phish.*-1;
    
    myresult=[];
    for i=1:size(result_ourwork,1)
        if(find(i==legith))
            label=1;
        elseif(find(i==phish))
            label=-1;
        end
        
        if(result_ourwork(i)>0)
            myresult=[myresult;label 1];
        else
            myresult=[myresult;label -1];
        end
    end
    x=1
    %--------------------------------------------------------------------
%     n1=size(result_legith,1);
%     number1 = n1-49;
%     sample_result_legith = result_legith(number1:n1);
%     min_legith = mean(sample_result_legith)
%     
%     n2=size(result_phish,1);
%     number2 = n2-49;
%     sample_result_phish = result_phish(number2:n2);
%     min_phish = mean(sample_result_phish)
    %---------------------------------------------------------------------- 
    
        %---------------------------------------------------------------------- 
    
%     figure(17)
%     plot(1:50,sample_result_legith,'b-s');
%     hold on;
%     plot(1:50, label_legith(1:50),'k.-');
%     hold on
%     
%     plot(50+1:100,sample_result_phish,'r-s');
%     hold on;
%     plot(50+1:100, label_phish(1:50),'k.-');
%     hold on
%% my plot  orginal

%     figure(n)
%     plot(1:size_result_legith,result_legith,'b');
%     hold on
%     plot(1:size_result_legith, label_legith,'k');
%     hold on
%     X = zeros(1,size(result_ourwork,1),'uint32');
% 
%     plot(X,'k');
%     hold on
%     
%     plot(size_result_legith+1:size_result_legith+size_result_phish,result_phish,'r');
%     hold on
%     plot(size_result_legith+1:size_result_legith+size_result_phish, label_phish,'k');
%     hold on
    %%
    for i=1:size(result_ourwork,1)    
        if result_ourwork(i)>0
            PredictLabel(i) = 1;
        else result_ourwork(i)<=0
            PredictLabel(i) = -1;
        end
    end
