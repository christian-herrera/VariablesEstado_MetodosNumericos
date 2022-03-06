%% Ejemplo de uso
%
%     f = @(t, x1)(x1^2);    %Funcion f(t, x1)=dx1/dt
%     CI = [0, 1];           %Condicion inicial -> (t0, x10)
%     N = 100;               %Cantidad de puntos
%     h = 0.1;               %Tamaño del paso
% 
% 
%     [t, x1] = Euler_1VE(CI, h, N, f);
%     plot(t, x1);
%

%% Funcion
function [t, x1] = Euler_1VE(CI, h, N, fun1, graficar)
    
    t = zeros(N, 1);
    x1 = t;

    t(1) = CI(1);
    x1(1) = CI(2);
    
    k = 2;
    while k <= N
        t(k) = t(k-1) + h;
        x1(k) = x1(k-1) + h * fun1(t(k-1), x1(k-1));
        k = k + 1;
    end
    
    if(nargin == 5 && graficar == 1)
        plot(t, x1);
        title("X1");
    end

 
end
