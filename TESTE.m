clear all
close all
clc

% fprintf('###########################################\n##                                       ##\n##     PROJETO COMPRESS�O DE IMAGENS     ##\n##                                       ##\n###########################################\n\n\n')

% S = input('Insira o valor de S: ')

video = VideoReader('Happy_Feet.avi');
get(video) %Coleta as informa��es do video
playvideo=read(video); %Verifica a quantidade de quadros do video
x=size(playvideo);
NumberOfFrames=x(1,4);


Fonte = Fonte(video,NumberOfFrames);
