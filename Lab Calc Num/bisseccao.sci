//Cria o vetor para armazenar alguns valores de x para plotar o gráfico
x = 0:0.01:30;

//Função f(x) aplicada aos valores de x
deff('y = f(x)', ['y = (x^2) - (7.6)*x + 11.55']);

//Gera o gráfico
plot(x,f);

function [raiz, x, iter, ea]=bisseccao(xl,xu,f,tol,imax)
    if(f(xl)*f(xu)>0) then
        error('Nenhuma raiz no intervalo f(xl)*f(xu) > 0');
        abort;
    end;

    iter=0;

    // Acha primeira aproximacao e verifica se já é a raiz
    xr = (xl+xu)/2;
    x(iter+1)=xr;
    test=f(xl)*f(xr);
    if(test<0) then
        xu = xr;
    elseif test>0 then
        xl = xr;
    else
        raiz=xr;
        ea(iter+1)=0;
        return
    end;
        
    while(%t)
        xrold = xr;
        xr = (xl+xu)/2;
        iter = iter+1;
        x(iter+1)=xr;
        if(xr ~= 0) then
            ea(iter)=abs((xr-xrold)/xr);
        end;
        test=f(xl)*f(xr);
        if(test<0) then
            xu = xr;
        elseif test > 0 then
            xl = xr;
        else
            ea(iter) = 0;
        end;
        if (ea(iter) <= tol) then
            raiz = xr;
            return;
        end;
        if(iter >= imax) then
            error('Número Máximo de Iterações Alcançado');        
        end;
    end;
end; 
