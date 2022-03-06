%% Ejemplo de uso
%
%     ug = 20;
%     ig = 2;
% 
%     f = @(t, il, uc1, uc2)(5*uc1 + 5*uc2 -5*ug);       %Funcion f(t,x1,x2,x3)=dx1/dt
%     g = @(t, il, uc1, uc2)(-6*il - 2*uc1 + 2*ug);      %Funcion g(t,x1,x2,x3)=dx2/dt
%     i = @(t, il, uc1, uc2)(-7*il - 7*ig);              %Funcion g(t,x1,x2,x3)=dx3/dt
%     CI = [0, 0, 0, 0];                                 %Condicion inicial -> (t0, x10, x20, x30)
%     N = 5000;
%     h = 0.01;
% 
% 
%     [t, il, uc1, uc2] = Euler_3VE(CI, h, N, f, g, i);
%     plot(t, il, t, uc1, t, uc2);
%

%% Funcion
function [t, x1, x2, x3] = Euler_3VE(CI, h, N, fun1, fun2, fun3, graficar)
    t = zeros(N, 1);
    x1 = t;
    x2 = t;
    x3 = t;

    t(1) = CI(1);
    x1(1) = CI(2);
    x2(1) = CI(3);
    x3(1) = CI(4);
    
    k = 2;
    while k <= N
        t(k) = t(k-1) + h;
        x1(k) = x1(k-1) + h * fun1(t(k-1), x1(k-1), x2(k-1), x3(k-1));
        x2(k) = x2(k-1) + h * fun2(t(k-1), x1(k-1), x2(k-1), x3(k-1));
        x3(k) = x3(k-1) + h * fun3(t(k-1), x1(k-1), x2(k-1), x3(k-1));
        k = k + 1;
    end
    
    if(nargin == 7 && graficar == 1)
        hold on;
        subplot(3, 1, 1);
        plot(t, x1);
        title("X1");
        subplot(3, 1, 2);
        plot(t, x2);
        title("X2");
        subplot(3, 1, 3);
        plot(t, x3);
        title("X3");
        hold off;
    end
 
end