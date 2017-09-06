//Cria o vetor para armazenar alguns valores de x para plotar o gráfico
x = 0:0.01:30;

//Função f(x) aplicada aos valores de x
deff('y = f(x)', ['y = (x^2) - (7.6)*x + 11.55']);

//Derivada de f(x) = 2x - 7.6
deff('k = fp(x)', ['k = 2*x - 7.6']);

//Gera o gráfico
plot(x,f);

function [raiz, x, iter, ea]=newtonRaphson(x0,f,fp,tol,imax)
    
    iter = 0; // inicializa numero de iteracoes
    xr = x0; // inicializa raiz aproximada com a inicial
    x(iter+1)=x0; // insere raiz inicial no vetor de raizes
    
    while (1)
        xrold = xr; 
        xr = xrold - f(xrold)/fp(xrold); // aplica formula de Newton
        iter = iter+1; // incrementa numero de iteracoes
        x(iter+1) = xr; // insere raiz aproximada no respectivo vetor
        if(xr ~= 0) then // calcula erro relativo
            ea(iter)=abs((xr-xrold)/xr);
        end;
        if(ea(iter) <= tol) then // se erro relativo menor que tol, FIM
            raiz = xr;
            return;
        end;
        if(iter >= imax) then // se excedeu num. maximo de iteracoes, FIM
            error('Número Máximo de Iterações Alcançado');
        end;
    end;

end;
