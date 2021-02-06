function [ output ] = RuleBase(data)
%%
% pressure tempeture => speed

% L  &  L   => VL
% L  &  M   => L
% L  &  H`  => L

% M  &  L   => M
% M  &  M   => M
% M  &  H`  => H

% H  &  L   => H
% H  &  M   => VH
% H  &  H`  => VH


%%
if strcmp(data,'LL')
    output = 'VL';
elseif strcmp(data,'LM')
    output = 'Lo';
elseif strcmp(data,'LH')
    output = 'Lo';
elseif strcmp(data,'ML')
    output = 'Mi';
elseif strcmp(data,'MM')
    output = 'Mi';
elseif strcmp(data,'MH')
    output = 'Hi';
elseif strcmp(data,'HL')
    output = 'Hi';
elseif strcmp(data,'HM')
    output = 'VH';
elseif strcmp(data,'HH')
    output = 'VH';
end
    
end

