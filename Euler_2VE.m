%% Ejemplo de uso
%
%     ug = 10;
%     ig = 2;
% 
%     f = @(t, uc, il)(-3*uc + 6*il - 2*ug -6*ig);      %Funcion f(t,x1,x2)=dx1/dt
%     g = @(t, uc, il)(-3*uc - 12*il + ug + 3*ig);      %Funcion g(x,x1,x2)=dx2/dt
%     CI = [0, 0, 0];                                   %Condicion inicial -> (t0, x10, x20)
%     N = 200;
%     h = 0.01;
% 
% 
%     [t, uc, il] = Euler_2VE(CI, h, N, f, g);
%     plot(t, uc, t, il);
%

%% Funcion
function [t, x1, x2] = Euler_2VE(CI, h, N, fun1, fun2, graficar)
    
    t = zeros(N, 1);
    x1 = t;
    x2 = t;

    t(1) = CI(1);
    x1(1) = CI(2);
    x2(1) = CI(3);
    
    k = 2;
    while k <= N
        t(k) = t(k-1) + h;
        x1(k) = x1(k-1) + h * fun1(t(k-1), x1(k-1), x2(k-1));
        x2(k) = x2(k-1) + h * fun2(t(k-1), x1(k-1), x2(k-1));
        k = k + 1;
    end
    
    if(nargin == 6 && graficar == 1)
        hold on;
        subplot(2, 1, 1);
        plot(t, x1);
        title("X1");
        subplot(2, 1, 2);
        plot(t, x2);
        title("X2");
        hold off;
    end


 
end
