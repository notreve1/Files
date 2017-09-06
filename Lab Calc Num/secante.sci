//Cria o vetor para armazenar alguns valores de x para plotar o gráfico
x = 0:0.01:30;

//Função f(x) aplicada aos valores de x
deff('y = f(x)', ['y = (x^2) - (7.6)*x + 11.55']);

//Gera o gráfico
plot(x,f);

function [raiz, x, iter, ea]= secante(xi,xf,f,tol,imax)
    
    if(f(xi)*f(xf)>0) then
        error('Nenhuma raiz no intervalo f(xi)*f(xf) > 0');
        abort;
    end;
    
    x1 = xi;
    x2 = xf;
    
    iter = 0;
    
    while(%t)
        xrold = x2;
        xr = x2-f(x2)*(x1-x2)/(f(x1)-f(x2));
        
        iter = iter + 1;
        
        x(iter+1) = xr;
        
        if(xr ~= 0) then
            ea(iter) = abs((xr-xrold)/xr);
        end;
        
        x1 = x2;
        x2 = xr;
        
        if (ea(iter) <= tol) then
            raiz = xr;
            return;
        end;
        
        if(iter >= imax) then
            error('Número Máximo de Iterações Alcançado');        
        end;
        
    end;    
end;
