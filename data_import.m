function [num_VioBlue,  int_VioBlue, x_VioBlue, y_VioBlue, ...
    num_FITC,  int_FITC, x_FITC, y_FITC, ...
    num_R_PE,  int_R_PE, x_R_PE, y_R_PE, ...
    num_APC,  int_APC,  x_APC, y_APC] = data_import(file_path)

    summary_data = xlsread(strcat(file_path, '\All EVs 385nm.csv'));
    num_VioBlue = summary_data(:,1);
    all_data = xlsread(strcat(file_path, '\EVs 385nm.csv'));
    int_VioBlue = all_data(:,3);
    x_VioBlue = all_data(:,9);
    y_VioBlue = all_data(:,10);
    
    summary_data = xlsread(strcat(file_path, '\All EVs 475nm.csv'));
    num_FITC = summary_data(:,1);
    all_data = xlsread(strcat(file_path, '\EVs 475nm.csv'));
    int_FITC = all_data(:,3);
    x_FITC = all_data(:,9);
    y_FITC = all_data(:,10);
    
    summary_data = xlsread(strcat(file_path, '\All EVs 555nm.csv'));
    num_R_PE = summary_data(:,1);
    all_data = xlsread(strcat(file_path, '\EVs 555nm.csv'));
    int_R_PE = all_data(:,3);
    x_R_PE = all_data(:,9);
    y_R_PE = all_data(:,10);
    
    summary_data = xlsread(strcat(file_path, '\All EVs 630nm.csv'));
    num_APC = summary_data(:,1);
    all_data = xlsread(strcat(file_path, '\EVs 630nm.csv'));
    int_APC = all_data(:,3);
    x_APC = all_data(:,9);
    y_APC = all_data(:,10);
    
end