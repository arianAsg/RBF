clc
clear
close all
%% Reading data
data=xlsread('Data-S.P..xlsx',2);

%% seprating train and test data with random indexes
ind=randperm(88);
train=data(ind(1:50),:);
test=data(ind(51:end),:);

%% seprating test and train data
train_x=train(:,1:4);
train_y=train(:,5);

test_x=test(:,1:4);
test_y=test(:,5);

%% instaliziation of radial bases nural network
goal=0;
spread=0.3;
MN=40;
DF=25;
trainFcn = 'trainlm';

%% train the network
net=newrb(train_x',train_y',goal,spread,MN,DF);

%% calculate y_cal
Y=sim(net,test_x');

%% calculate MSE value
MSE_NET=((sum(Y'-test_y).^2))./38

%% viewing the network
view(net)

%%

