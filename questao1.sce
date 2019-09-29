// PRIMEIRO TRABALHO DE INTELIGÊNCIA COMPUTACIONAL
// Questão 1
// Aluno: José Lopes de Souza Filho
// Matrícula: 389097
// Aplicação: Scilab, versão 6.0.2
// SO: Linux Mint 19.2 Tina
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// CRIAÇÃO DAS MATRIZES
//-----------------------------------------------------------------------------

clear; // Limpa as variáveis armazenadas
clc; // Limpa o console

// Cria um vetor coluna de valores 0 a 20 com passo 0,01 e os atribui
// as variáveis x e y
x=[0: 0.01 : 20]';
y=[0: 0.01 : 20]';

// Cria uma função f(x,y) = |xsen(y.pi/4)+ysen(x.pi/4)| e a atribui a z
z=abs((x.*sin(y.*%pi/4))+(y.*sin(x.*%pi/4)));

//-----------------------------------------------------------------------------
// PLOTA O GRÁFICO DA FUNÇÃO
//-----------------------------------------------------------------------------

clf; // Limpa a janela gráfica

plot3d(x,y,z)
xtitle('Gráfico da questão 1', 'Eixo X', 'Eixo Y', 'Eixo Z = f(x,y)');

//-----------------------------------------------------------------------------
// IMPLEMENTAÇÃO DO ALGORITMO HILL CLIMBING
//-----------------------------------------------------------------------------

// Gera um número aleatório entre 1 e o número de linhas da matriz
n=grand(1,1,"uin",1,size(z, "r"));

while n<=size(z, "r") do
maior = z(n);
    if(n>1 & maior < z(n-1))
        maior = z(n-1);
        n=n-1;
    elseif(n<size(z, "r") & maior < z(n+1))
        maior = z(n+1);
        n=n+1;
    elseif(n==1)
        if(maior < z(n+1))
            maior = z(n+1);
            n=n+1;
        else
            disp(maior, n, "Máximo valor local da função: ");
            break
        end
    elseif(n==size(z, "r"))
        if(maior < z(n-1))
            maior = z(n-1);
            n=n-1;
        else
            disp(maior, n, "Máximo valor local da função: ");
            break
        end
    else
        disp(maior,n,"Máximo valor local da função: ");
        break
    end
end
