    %% zero one Loss  =  if hate_y == label => 0  else 1
    x1=0;x2=0;x3=0;x4=0;x5=0;x6=0;x7=0;x8=0;x9=0;x10=0;x11=0;x12=0;x13=0;x14=0;x15=0;x16=0;
    if y_t ~= PA_hat_y_t
        x1=1;
    elseif y_t == PA_hat_y_t
        x1=0;
    end
    %%
    if y_t ~= PA1_hat_y_t
        x2=1;
    elseif y_t == PA1_hat_y_t
        x2=0;
    end
    %%
    if y_t ~= PA2_hat_y_t
        x3=1;
    elseif y_t == PA2_hat_y_t
        x3=0;
    end
    %%
    if y_t ~= Perceptron_hat_y_t
        x4=1;
    elseif y_t == Perceptron_hat_y_t
        x4=0;
    end
    %%
    if y_t ~= ROMMA_hat_y_t
        x5=1;
    elseif y_t == ROMMA_hat_y_t
        x5=0;
    end 
    %%
    if y_t ~= aROMMA_hat_y_t
        x6=1;
    elseif y_t == aROMMA_hat_y_t
        x6=0;
    end
    %%
    if y_t ~= ALMA_hat_y_t
        x7=1;
    elseif y_t == ALMA_hat_y_t
        x7=0;
    end
    %%
    if y_t ~= OGD_hat_y_t
        x8=1;
    elseif y_t == OGD_hat_y_t
        x8=0;
    end
    %%
    if y_t ~= SOP_hat_y_t
        x9=1;
    elseif y_t == SOP_hat_y_t
        x9=0;
    end
    %%
    if y_t ~= IELLIP_hat_y_t
        x10=1;
    elseif y_t == IELLIP_hat_y_t
        x10=0;
    end    
    %%
    if y_t ~= CW_hat_y_t
        x11=1;
    elseif y_t == CW_hat_y_t
        x11=0;
    end  
    %%
    if y_t ~= NHERD_hat_y_t
        x12=1;
    elseif y_t == NHERD_hat_y_t
        x12=0;
    end
    %%
    if y_t ~= AROW_hat_y_t
        x13=1;
    elseif y_t == AROW_hat_y_t
        x13=0;
    end  
    %%
    if y_t ~= NAROW_hat_y_t
        x14=1;
    elseif y_t == NAROW_hat_y_t
        x14=0;
    end  
    %%
    if y_t ~= SCW_hat_y_t
        x15=1;
    elseif y_t == SCW_hat_y_t
        x15=0;
    end  
    %%
    if y_t ~= SCW2_hat_y_t
        x16=1;
    elseif y_t == SCW2_hat_y_t
        x16=0;
    end  
