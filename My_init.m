function model = My_init(options_PA, d, nb_class,model1,i)
        if i==1
            model    = init_model(options_PA, d, nb_class);
        else
            model = model1;
        end
end