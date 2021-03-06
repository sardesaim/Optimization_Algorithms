clc; clear all; close all;
%% Declare the symbolic variables
syms x1 x2 alph;
% Declare function in terms of x1 x2
f = @(x1, x2) x1.^2+x2.^2+x1.*x2;
X_init = [0.8,-.25];
epsilon = 0.075;
k = 1;

[a0, b0] = Bracketing(f, X_init, epsilon); %run bracketing on phia to find points
[s,t, dat] = GoldenSection2(a0,b0,f);
[s1,t1, dat1] = FibonacciSeq(a0,b0,f);
xlswrite('GoldenSearch.xlsx',dat);
xlswrite('Fibonacci.xlsx', dat1);
%%
%%Previous attempt was to reduce range of alpha so that f(x-alpha*g) would
%be minimum. 

% replace x1 x2 by x1-alph*gx(1) and x2-alph*gx(2) resp
% phia = @(alph) subs(f(x1-alph*gx(1), x2-alph*gx(1)), [x1 x2], X_init(k));
% x0 = X_init; x1 = x0+epsilon; x2 = x1+2*epsilon;
% n = 1;
% alpha = GoldenSection(a0,b0, phia); %run golden section on the bracketed points 
% X_init{2} = X_init{1} - alpha*double(subs(gx,[x1 x2], X_init(1))); %find next point with that alpha
% k = 2;
% while(norm(X_init{end}-X_init{end-1},2)>0.075) %run till distance between two points is less than eps
%     phia = @(alph) subs(f(x1-alph*gx(1), x2-alph*gx(1)), [x1 x2], X_init(k));
%     [a0, b0] = Bracketing(phia, epsilon);
%     alpha,dat = GoldenSection(a0,b0, phia);
%     X_init{k+1} = X_init{k} - alpha*double(subs(gx,[x1 x2], X_init(k)));
%     k = k+1;
% end
% %plotting
% x = linspace(-1,1,50);
% y = x;
% [x1_plt,x2_plt] = meshgrid(x,y);
% box on; mesh(x1_plt,x2_plt,f(x1_plt, x2_plt));
% figure;
% contour(x1_plt,x2_plt,f(x1_plt,x2_plt), 20);
% for i = 1:length(X_init)
%     px(i) = X_init{i}(1);
%     py(i) = X_init{i}(2);
% end
% hold on;
% plot(px, py, 'x-'); %plot sequence of points starting from starting point1
% 
% %Fibonacci
% while(norm(X_init{end}-X_init{end-1},2)>0.01) %run till distance between two points is less than eps
%     phia = @(alph) subs(f(x1-alph*gx(1), x2-alph*gx(1)), [x1 x2], X_init(k));
%     [a0, b0] = Bracketing(phia, epsilon);
%     alpha = FibonacciSeq(a0,b0, phia);
%     X_init{k+1} = X_init{k} - alpha*double(subs(gx,[x1 x2], X_init(k)));
%     k = k+1;
% end
% %plotting
% x = linspace(-1,1,50);
% y = x;
% [x1_plt,x2_plt] = meshgrid(x,y);
% box on; mesh(x1,x2,f(x1, x2));
% figure;
% contour(x1_plt,x2_plt,f(x1_plt,x2_plt), 20);
% for i = 1:length(X_init)
%     px1(i) = X_init{i}(1);
%     py1(i) = X_init{i}(2);
% end
% hold on;
% plot(px1, py1, 'x-'); %plot sequence of points starting from starting point1