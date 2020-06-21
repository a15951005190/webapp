function [N,Tau,Strain,pStrain,eStrain,E] = Load_Data_DH(value)
sig = [];
sig = xlsread(value);
N = sig(:,2);
Tau = sig(:,3);
Strain = sig(:,4);
eStrain = sig(:,6);
pStrain = sig(:,5);
% sig_2 = xlsread(value,2);
% E = sig_2(100,2);

%E即数据表中每个试棒G的平均值，例如GC15有七个试棒，取七个试棒G的平均值；
E_all=xlsread(value,'SpecimenInformation','G:G');
 E=mean(E_all);

end
