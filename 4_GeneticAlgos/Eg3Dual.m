clc; close all;
b = [0 0 -4 -3 -3 -2 -2]';
Aeq = [];
beq = [];
A = [1 -1 -1 0 0 0 0 0 0 0; ...
    0 0 1 -1 -1 0 0 0 0 0; ...
    1 0 0 0 0 1 0 0 0 0; ...
    0 1 0 0 0 0 1 0 0 0;...
    0 0 1 0 0 0 0 1 0 0;...
    0 0 0 1 0 0 0 0 1 0;...
    0 0 0 0 1 0 0 0 0 1]';
c = [0 -10 0 -6 -20 0 0 0 0 0];
% lb = [0 0 0 0 0];
% ub = [4 3 3 2 2];
[lda,fval] = linprog(b, A, c, Aeq, beq);
for i = 1:length(lda)
    fprintf('Lambda%d = %d\n', i, lda(i));
end
fprintf('The maximum value of function is %d\n', fval);