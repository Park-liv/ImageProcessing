close all
clear all

A = randi([0,255],1,1000);
x = [0:255];
y = hist(A,x);
bar(x,y)