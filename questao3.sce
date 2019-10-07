// PRIMEIRO TRABALHO DE INTELIGÊNCIA COMPUTACIONAL
// Questão 3
// Aluno: José Lopes de Souza Filho
// Matrícula: 389097
// Aplicação: Scilab, versão 6.0.2
// SO: Linux Mint 19.2 Tina
//-----------------------------------------------------------------------------

clear;  //Limpa as variáveis armazenadas
clc;    //Limpa a tela

//-----------------------------------------------------------------------------
// Lê matriz de dados de número variável de linhas por 2 colunas
//-----------------------------------------------------------------------------
MD = read('aerogerador.dat', -1, 2);

//-----------------------------------------------------------------------------
// Determina o número de linhas da matriz
//-----------------------------------------------------------------------------
m=length(MD(:,1))

//-----------------------------------------------------------------------------
// Determina os principais parâmetros para determinar as retas de ajuste
//-----------------------------------------------------------------------------
SX1 = 0;    //Soma dos valores de x
SX2 = 0;    //Soma dos valores dos quadrados de x
SX3 = 0;    //Soma dos valores dos cubos de x
SX4 = 0;    //Soma dos valores de x elevado a quarta potência
SX5 = 0;    //Soma dos valores de x elevado a quinta potência
SX6 = 0;    //Soma dos valores de x elevado a sexta potência
SX7 = 0;    //Soma dos valores de x elevado a setima potência
SX8 = 0;    //Soma dos valores de x elevado a oitava potência
SX9 = 0;    //Soma dos valores de x elevado a nona potência
SX10 = 0;    //Soma dos valores de x elevado a décima potência

SY1 = 0;    //Soma dos valores de y
SYX1 = 0;   //soma dos produtos de y por x
SYX2 = 0;   //Soma dos produtos de y pelo quadrado de x
SYX3 = 0;   //Soma dos produtos de y pelo cubo de x
SYX4 = 0;   //Soma dos produtos de y pela terceira potencia de x
SYX5 = 0;   //Soma dos produtos de y pela quarta potencia de x

//-----------------------------------------------------------------------------
// Determina os valores essenciais para o processo
//-----------------------------------------------------------------------------
for j=1:m do
    SX1 = SX1 + MD(j,1);
    SX2 = SX2 + MD(j,1)^2;
    SX3 = SX3 + MD(j,1)^3;
    SX4 = SX4 + MD(j,1)^4;
    SX5 = SX5 + MD(j,1)^5;
    SX6 = SX6 + MD(j,1)^6;
    SX7 = SX7 + MD(j,1)^7;
    SX8 = SX8 + MD(j,1)^8;
    SX9 = SX9 + MD(j,1)^9;
    SX10 = SX10 + MD(j,1)^10;
    
    SY1 = SY1 + MD(j,2);
    SYX1 = SYX1 + (MD(j,1) * MD(j,2));
    SYX2 = SYX2 + ((MD(j,1)^2) * MD(j,2));
    SYX3 = SYX3 + ((MD(j,1)^3) * MD(j,2));
    SYX4 = SYX4 + ((MD(j,1)^4) * MD(j,2));
    SYX5 = SYX5 + ((MD(j,1)^5) * MD(j,2));
end

//-----------------------------------------------------------------------------
// Monta as equações, as matrizes e determina a solução do sistema linear
//-----------------------------------------------------------------------------

//Matriz dos coeficientes do sistema linear de 2 grau
A = [m SX1 SX2; 
    SX1 SX2 SX3; 
    SX2 SX3 SX4];
//Vetor dos termos independentes do sistema linear de 2 grau
b = [SY1; SYX1; SYX2];
//-----------------------------------------------------------------------------
//Matriz dos coeficientes do sistema linear de 3 grau
C = [m SX1 SX2 SX3; 
    SX1 SX2 SX3 SX4; 
    SX2 SX3 SX4 SX5; 
    SX3 SX4 SX5 SX6]; 
//Vetor dos termos independentes do sistema linear de 3 grau
d = [SY1; SYX1; SYX2; SYX3];
//-----------------------------------------------------------------------------
// Matriz dos coeficientes do sistema linear de 4 grau
E = [m SX1 SX2 SX3 SX4; 
     SX1 SX2 SX3 SX4 SX5; 
     SX2 SX3 SX4 SX5 SX6; 
     SX3 SX4 SX5 SX6 SX7; 
     SX4 SX5 SX6 SX7 SX8];
// Vetor dos termos independentes do sistema linear de 4 grau
f = [SY1; SYX1; SYX2; SYX3; SYX4];
//-----------------------------------------------------------------------------
// Matriz dos coeficientes do sistema linear de 5 grau
G = [m SX1 SX2 SX3 SX4 SX5; 
    SX1 SX2 SX3 SX4 SX5 SX6; 
    SX2 SX3 SX4 SX5 SX6 SX7; 
    SX3 SX4 SX5 SX6 SX7 SX8; 
    SX4 SX5 SX6 SX7 SX8 SX9; 
    SX5 SX6 SX7 SX8 SX9 SX10]; 
// Vetor dos termos independentes do sistema linear de 5 grau
h = [SY1; SYX1; SYX2; SYX3; SYX4; SYX5];
//-----------------------------------------------------------------------------
// Resolve sistema de segundo grau com divisão à esquerda da matriz A pelo vetor b
S = A\b; 
// Resolve sistema de terceiro grau com divisão à esquerda da matriz C pelo vetor d
T = C\d;
// Resolve sistema de quarto grau com divisão à esquerda da matriz E pelo vetor f
U = E\f;
// Resolve sistema de quinto grau com divisão à esquerda da matriz G pelo vetor h
V = G\h; 

//-----------------------------------------------------------------------------
// Atribui variáveis às soluções dos sistemas lineares
//-----------------------------------------------------------------------------
a0 = S(1);
a1 = S(2);
a2 = S(3);

b0 = T(1);
b1 = T(2);
b2 = T(3);
b3 = T(4);

c0 = U(1);
c1 = U(2);
c2 = U(3);
c3 = U(4);
c4 = U(5);

d0 = V(1);
d1 = V(2);
d2 = V(3);
d3 = V(4);
d4 = V(5);
d5 = V(6);

//-----------------------------------------------------------------------------
// Exibe no console os resultados dos sistemas lineares encontrados
// e cria vetores de valores das funções
//-----------------------------------------------------------------------------

disp("-------EQUAÇÃO DO SEGUNDO GRAU---------")
disp("a0 = " + string(a0)); //Exibe valor do termo independente da equação
disp("a1 = " + string(a1)); //Exibe valor do coeficiente de x da equação
disp("a2 = " + string(a2)); //Exibe valor do coeficiente de x² da equação
// Exibe a equação encontrada y
disp("Equação da reta Y = " + string(a0) + " + " + string(a1) + "x" + " + " + string(a2) + "x^2");
// Atribui a um vetor os valores encontrados
y = a0 + (a1*(MD(:,1))) + (a2*(MD(:,1)^2));

disp("-------EQUAÇÃO DO TERCEIRO GRAU---------")
disp("b0 = " + string(b0)); //Exibe valor do termo independente da equação
disp("b1 = " + string(b1)); //Exibe valor do coeficiente de x da equação
disp("b2 = " + string(b2)); //Exibe valor do coeficiente de x² da equação
disp("b3 = " + string(b3)); //Exibe valor do coeficiente de x³ da equação
// Exibe a equação encontrada y2
disp("Equação da reta Y = " + string(b0) + " + " + string(b1) + "x" + " + " + string(b2) + "x^2" + " + " + string(b3) + "x^3");
// Atribui a um vetor os valores encontrados
y2 = b0 + (b1*(MD(:,1))) + (b2*(MD(:,1)^2)) + (b3*(MD(:,1)^3));

disp("-------EQUAÇÃO DO QUARTO GRAU---------")
disp("c0 = " + string(c0)); //Exibe valor do termo independente da equação
disp("c1 = " + string(c1)); //Exibe valor do coeficiente de x da equação
disp("c2 = " + string(c2)); //Exibe valor do coeficiente de x² da equação
disp("c3 = " + string(c3)); //Exibe valor do coeficiente de x³ da equação
disp("c4 = " + string(c4)); //Exibe valor do coeficiente de x⁴ da equação
// Exibe a equação encontrada y3
disp("Equação da reta Y = " + string(c0) + " + " + string(c1) + "x" + " + " + string(c2) + "x^2" + " + " + string(c3) + "x^3" + " + " + string(c4) + "x^4");
// Atribui a um vetor os valores encontrados
y3 = c0 + (c1*(MD(:,1))) + (c2*(MD(:,1)^2)) + (c3*(MD(:,1)^3)) + (c4*(MD(:,1)^4));

disp("-------EQUAÇÃO DO QUINTO GRAU---------")
disp("d0 = " + string(d0)); //Exibe valor do termo independente da equação
disp("d1 = " + string(d1)); //Exibe valor do coeficiente de x da equação
disp("d2 = " + string(d2)); //Exibe valor do coeficiente de x² da equação
disp("d3 = " + string(d3)); //Exibe valor do coeficiente de x³ da equação
disp("d4 = " + string(d4)); //Exibe valor do coeficiente de x⁴ da equação
disp("d5 = " + string(d5)); //Exibe valor do coeficiente de x⁵ da equação
// Exibe a equação da reta y
disp("Equação da reta Y = " + string(d0) + " + " + string(d1) + "x" + " + " + string(d2) + "x^2" + " + " + string(d3) + "x^3" + " + " + string(d4) + "x^4" + " + " + string(d5) + "x^4");
// Atribui a um vetor os valores encontrados
y4 = d0 + (d1*(MD(:,1))) + (d2*(MD(:,1)^2)) + (d3*(MD(:,1)^3)) + (d4*(MD(:,1)^4)) + (d5*(MD(:,1)^5));

//-----------------------------------------------------------------------------
// Plota os gráficos
//-----------------------------------------------------------------------------

clf; // Limpa a janela gráfica

//Plota o gráfico 1
subplot(221);
scatter(MD(:,1), MD(:, 2), ".");
plot2d(MD(:,1), y);
xlabel("Regressão polinomial de grau 2");

//Plota o gráfico 2
subplot(222);
scatter(MD(:,1), MD(:, 2), ".");
plot2d(MD(:,1), y2);
xlabel("Regressão polinomial de grau 3");

//Plota o gráfico 3
subplot(223);
scatter(MD(:,1), MD(:, 2), ".");
plot2d(MD(:,1), y3);
xlabel("Regressão polinomial de grau 4");

//Plota o gráfico 4
subplot(224);
scatter(MD(:,1), MD(:, 2), ".");
plot2d(MD(:,1), y4);
xlabel("Regressão polinomial de grau 5");

//Fim do programa
