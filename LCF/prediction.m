function [sigmaF,b,c,epsilonF,Nt,K,n,prediction_N,Error_prediction_N]=prediction(load_name,Strain_total,CycleNumber)
[N,Tau,Strain,pStrain,eStrain,E] = Load_Data_DH(load_name);

% Basqiun
%50
figure;
semilogx(2*N,eStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');
miu=0;
[Ns,~,y_50,~,sigmaF_B,b_B] = Basqiun(N,eStrain,E,miu);
semilogx(2*Ns,y_50,'g');
legend('数据点','p=50%');

% Basqiun_sigma_num=0.246;
 Basqiun_sigma_num=sigmaF_B;

%5-95
figure;
semilogx(2*N,eStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');
miu=1.645;
[Ns,y_Negative,~,y_Positive,~,~]= Basqiun(N,eStrain,E,miu);
semilogx(2*Ns,y_Negative,'k');
semilogx(2*Ns,y_Positive,'r');
legend('数据点','p=5%','p=95%');

%1-99
figure;
semilogx(2*N,eStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');
miu=2.326;
[Ns,y_Negative,~,y_Positive,~,~]= Basqiun(N,eStrain,E,miu);
semilogx(2*Ns,y_Negative,'k');
semilogx(2*Ns,y_Positive,'r');
legend('数据点','p=1%','p=99%');

%MansonCoffin
%50
figure;
semilogx(2*N,pStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');
miu=0;
[Ns,~,y_50,~,epsilonF_M,c_M]=MansonCoffin(N,pStrain,miu);
semilogx(2*Ns,y_50,'g');
legend('数据点','p=50%');

 MansonCoffin_sigma_num=epsilonF_M;
% MansonCoffin_sigma_num=0.2227;

%5-95
figure;
semilogx(2*N,pStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');
miu=1.645;
[Ns,y_Negative,~,y_Positive,~,~]=MansonCoffin(N,pStrain,miu);
semilogx(2*Ns,y_Negative,'k');
semilogx(2*Ns,y_Positive,'r');
legend('数据点','p=5%','p=95%');

%1-99
figure;
semilogx(2*N,pStrain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');
miu=2.326;
[Ns,y_Negative,~,y_Positive,~,~]=MansonCoffin(N,pStrain,miu);
semilogx(2*Ns,y_Negative,'k');
semilogx(2*Ns,y_Positive,'r');
legend('数据点','p=1%','p=99%');
%Nt
Nt= (epsilonF_M*E/sigmaF_B)^(1/(b_B-c_M))/2;

%MuraManson
figure;
loglog(2*N,Strain,'k*');
hold on
xlabel('2N');
ylabel('\epsilon');
title('\epsilon-N Curve');
[sigmaF,b,c,epsilonF,T_M,s] = MuraManson(sigmaF_B,b_B,c_M,epsilonF_M,Strain,N,E);
loglog(T_M,s,'r');



%CyclicRelation
figure;
plot(Strain,Tau,'k*');
hold('on')
axis([0,inf,0,inf]);
[s,T_M,K,n] = CyclicRelation(Strain,Tau,E);
plot(s,T_M,'r');
ylabel('\tau/Mpa');
xlabel('\epsilon');
title('Cycle \tau-\epsilon Curve');


%%BestFitting Prediction Load
sigma_F_num = sigmaF_B;
b_num = b_B;
epsilon_F_num = epsilonF_M;
c_num = c_M;
%Basqiun_sigma_num = Basqiun_sigma(1,num);
% MansonCoffin_sigma_num = MansonCoffin_sigma(1,num);
Ns = 100:1:1e5;
A=log10(sigma_F_num/E);
B=b_num;
C=c_num;
D=log10(epsilon_F_num);
%%Basquin 50%
figure;
u=A+B*log10(2*Ns);
y_50=10.^u;
loglog(2*Ns,y_50,'g');
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');

%%Basquin 5-95%
miu = 1.645;
u=A+B.*log10(2*Ns);
y_Negative=10.^(u-miu*Basqiun_sigma_num/E);
y_Positive=10.^(u+miu*Basqiun_sigma_num/E);
figure;
loglog(2*Ns,y_Negative,'g');
hold on
loglog(2*Ns,y_Positive,'r');
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');
legend('p=5%','p=95%');

%%Basquin 1-99%
miu = 2.326;
u=A+B.*log10(2*Ns);
y_Negative=10.^(u-miu*Basqiun_sigma_num/E);
y_Positive=10.^(u+miu*Basqiun_sigma_num/E);
figure;
loglog(2*Ns,y_Negative,'g');
hold on
loglog(2*Ns,y_Positive,'r');
xlabel('2N');
ylabel('\epsilon_{e}');
title('\epsilon_{e}-N Curve');
legend('p=1%','p=99%');

%%MansonCoffin 50%
u=D+C*log10(2*Ns);
y_50=10.^u;
figure;
loglog(2*Ns,y_50,'b');
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');

%%MansonCoffin 5-95%
miu = 1.645;
u=D+C*log10(2*Ns);
y_Negative=10.^(u-miu*MansonCoffin_sigma_num);
y_Positive=10.^(u+miu*MansonCoffin_sigma_num);
figure;
loglog(2*Ns,y_Negative,'g');
hold on
loglog(2*Ns,y_Positive,'r');
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');
legend('p=5%','p=95%');

%%MansonCoffin 1-99%
miu = 2.326;
u=D+C*log10(2*Ns);
y_Negative=10.^(u-miu*MansonCoffin_sigma_num);
y_Positive=10.^(u+miu*MansonCoffin_sigma_num);
figure;
loglog(2*Ns,y_Negative,'g');
hold on
loglog(2*Ns,y_Positive,'r');
xlabel('2N');
ylabel('\epsilon_{p}');
title('\epsilon_{p}-N Curve');
legend('p=1%','p=99%');

%%MuraManson
y=sigmaF/E*(2*Ns).^b+epsilonF*(2*Ns).^c;
figure;
semilogx(2*Ns,y,'r');
xlabel('2N');
ylabel('\epsilon');
title('\epsilon-N Curve');
  

%%Prediction_50
N_Basquin_50 = (Strain_total*E/sigma_F_num)^(1/b_num)/2;
N_MansonCoffin_50 = (Strain_total/epsilon_F_num)^(1/c_num)/2;   
%%Prediction_5-95
N_Basquin_5 = 10^((log10(Strain_total)+miu*Basqiun_sigma_num-A)/B)/2;
N_Basquin_95 = 10^((log10(Strain_total)-miu*Basqiun_sigma_num-A)/B)/2;
N_MansonCoffin_5 = 10^((log10(Strain_total)+miu*MansonCoffin_sigma_num-D)/C)/2;
N_MansonCoffin_95 = 10^((log10(Strain_total)-miu*MansonCoffin_sigma_num-D)/C)/2;
%%Prediction_1-99
N_Basquin_1 = 10^((log10(Strain_total)+miu*Basqiun_sigma_num-A)/B)/2;
N_Basquin_99 = 10^((log10(Strain_total)-miu*Basqiun_sigma_num-A)/B)/2;
N_MansonCoffin_1 = 10^((log10(Strain_total)+miu*MansonCoffin_sigma_num-D)/C)/2;
N_MansonCoffin_99 = 10^((log10(Strain_total)-miu*MansonCoffin_sigma_num-D)/C)/2;
%%MuraManson
syms N
N=vpasolve(Strain_total==sigmaF/E*(2*N).^b+epsilonF*(2*N).^c,N);
N_MuraManson = double(N);
prediction_N=table(N_Basquin_50,N_MansonCoffin_50,N_Basquin_5,N_Basquin_95,N_MansonCoffin_5,N_MansonCoffin_95,N_Basquin_1,N_Basquin_99,N_MansonCoffin_1,N_MansonCoffin_99,N_MuraManson);
%%Error
value=CycleNumber;
Error_N_Basquin_50 = (N_Basquin_50 - value)/value;
Error_N_MansonCoffin_50 = (N_MansonCoffin_50 - value)/value;
Error_N_Basquin_5 = (N_Basquin_5 - value)/value;
Error_N_Basquin_95 = (N_Basquin_95 - value)/value;
Error_N_MansonCoffin_5 = (N_MansonCoffin_5 - value)/value;
Error_N_MansonCoffin_95 = (N_MansonCoffin_95 - value)/value;
Error_N_Basquin_1 = (N_Basquin_99 - value)/value;
Error_N_Basquin_99 = (N_Basquin_99 - value)/value;
Error_N_MansonCoffin_1 = (N_MansonCoffin_1 - value)/value;
Error_N_MansonCoffin_99 = (N_MansonCoffin_99 - value)/value;
Error_N_MuraManson = (N_MuraManson - value)/value;
Error_prediction_N=table(Error_N_Basquin_50,Error_N_MansonCoffin_50,Error_N_Basquin_5,Error_N_Basquin_95,Error_N_MansonCoffin_5,Error_N_MansonCoffin_95,Error_N_Basquin_1,Error_N_Basquin_99,Error_N_MansonCoffin_1,Error_N_MansonCoffin_99,Error_N_MuraManson);



end
