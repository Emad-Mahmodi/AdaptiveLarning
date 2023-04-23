function [TPR, TNR , Accuracy , FSCORE , MCC , TP,TN,FN,FP] = my_validation(result , myStart , myend)

TP=0;TN=0;FN=0;FP=0;

% algorithm(:,1) ==> our real label 
% algorithm(:,2) ==> our desired label
for i=myStart:myend,
    
    if(result(i,1)==1 && result(i,2)==1)
        TP = TP+1;
    elseif(result(i,1)==-1 && result(i,2)==-1)
        TN = TN+1;
    elseif(result(i,1)==1 && result(i,2)==-1)  
        FN = FN+1;
    elseif(result(i,1)==-1 && result(i,2)==1)
        FP = FP+1;
    end
end

TPR = TP/(TP+FN);
TNR = TN/(TN+FP);
Accuracy = (TP+TN)/(TP+TN+FP+FN);
FSCORE = (2*TP)/(2*TP+FP+FN);
MCC = ((TP*TN)-(FP*FN))/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));










