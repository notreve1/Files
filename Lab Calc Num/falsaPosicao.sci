//Cria o vetor para armazenar alguns valores de x para plotar o gráfico
x = 0:0.01:30;

//Função f(x) aplicada aos valores de x
deff('y = f(x)', ['y = (x^2) - (7.6)*x + 11.55']);

//Gera o gráfico
plot(x,f);

function [raiz, x, iter, ea]= falsaPosicao(xl,xu,f,tol,imax)
    
    if(f(xl)*f(xu)>0) then
        error('Nenhuma raiz no intervalo f(xl)*f(xu) > 0');
        abort;
    end;
    
    iter = 0;
    
    xr = xu -(f(xu)*(xl-xu)) /(f(xl) - f(xu));
    x(iter+1) = xr;
    
    if (f(xl) * f(xr) < 0) then
        xu = xr;
        
    elseif (f(xl)*f(xr) > 0) then
        xl = xr;
    else
        raiz = xr;
        ea(iter+1) = 0;
        return
    end;
    
    while(%t)
        xrold = xr;
        xr = xu - (f(xu)*(xl-xu)) / (f(xl) - f(xu));
        iter = iter +1;
        x(iter+1) = xr;
        
        if(xr ~= 0) then
            ea(iter) = abs((xr-xrold)/xr);
        end;
        
        if(f(xl)*f(xr) < 0) then
            xu = xr;
            
        elseif(f(xl)*f(xr) > 0) then
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
            
        
    
    
    
    
    
