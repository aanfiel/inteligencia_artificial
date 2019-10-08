# 29/09/2019: Trabalho 1 de inteligência computacional
### Este repositório hospeda os arquivos necessários à execução do trabalho 1 realizado durante os estudos da disciplina de inteligência computacional

# Universidade Federal do Ceará
### Inteligência Computacional
### Professor: Jarbas Joaci de Mesquita Sá Júnior

### Construído em:

* [Scilab 6.0.2](https://www.scilab.org/) - Software open source para computação numérica
* [Linux Mint 19.2 Tina](https://www.linuxmint.com/) - Sistema operacional usado

### Autor:

* **José Lopes de S. Filho** - [LinkedIn](https://www.linkedin.com/in/joselopesfilho/)
* *Engenharia da Computação (UFC) - Matrícula # 389097*

### Licença:

Este projeto é licenciado sob a MIT License - ver o arquivo [LICENSE.md](LICENSE.md) para detalhes

## Questão 1

*Encontre o máximo da função f(x,y) = |xsen(yπ/4) + ysen(xπ/4)| por meio do algoritmo hill-climbing. As variáveis x e y pertencem ao intervalo entre 0 e 20. Os vizinhos de determinado estado (x, y) são (x, y ± 0,01), (x ± 0,01, y) e (x ± 0,01, y ± 0,01). Por exemplo, os vizinhos do estado (1,00; 1,00) são (1,00; 1,01), (1,01; 1,01), (0,99; 0,99), (0,99; 1,00) etc.*

### Iniciando 
Para a resolução desta questão e criação deste relatório foram usados os seguintes arquivos:

* [questao1.sce](questao1.sce) - Código-fonte da aplicação proposta na questão
* [grafico_q1.png](grafico_q1.png) - Gráfico gerado pela aplicação durante a execução
* [console_q1.png](console_q1.png) - Retorno do console da aplicação ao final da execução
* [console_q1_2.png](console_q1_2.png) - Retorno do console da aplicação ao executar a aplicação mais de uma vez

## Código comentado

### Parte 1: Criação dos vetores
Primeiramente, foram criados os dados dos dois eixos *x* e *y*. Após a limpeza das variáveis armazenadas e do console para evitar possíveis conflitos, em seguida foram criados doid vetores com valores de 0 a 20 a intervalos de 0,01.
```
clear; // Limpa as variáveis armazenadas
clc; // Limpa o console

// Cria um vetor coluna de valores 0 a 20 com passo 0,01 e os atribui as variáveis x e y
x=[0: 0.01 : 20]';
y=[0: 0.01 : 20]';
```
### Parte 2: Definição da função solicitada
Em seguida, foi criado o vetor *z* com os valores de acordo com a função solicitada na questão.

```
// Cria uma função f(x,y) = |xsen(y.pi/4)+ysen(x.pi/4)| e a atribui a z
z=abs((x.*sin(y.*%pi/4))+(y.*sin(x.*%pi/4)));
```
### Parte 3: Plotagem do gráfico da função
No código abaixo, a janela gráfica é limpa, o gráfico da função solicitada na questão é plotado com os eixos e título do gráfico atribuídos.

```
clf; // Limpa a janela gráfica
plot3d(x,y,z)
xtitle('Gráfico da questão 1', 'Eixo X', 'Eixo Y', 'Eixo Z = f(x,y)');
```
### Parte 4: Implementação do algoritmo hill climbing
De início, gera-se um número aleatório entre 1 e o tamanho do vetor *z*

```
n=grand(1,1,"uin",1,size(z, "r"));
```
Em seguida, criou-se um laço while que irá durar enquanto o valor de *n* for menor ou igual ao tamanho máximo do vetor *z*.
```
while n<=size(z, "r") do
```
Foi criada uma variável para armazenar o valor de cada elemento do vetor *z* por iteração.
```
maior = z(n);
```
Nesse momento, iniciam-se os testes de valor - Para cada situação prevista, o algoritmo deve ter um dado comportamento. Analisemos cada uma delas:

Para o primeiro caso, se *n* for maior que 1 *(ou seja: não for o primeiro elemento do vetor - pois se fosse, ele poderia voltar a um elemento não existente e retornar erro)* e for menor que seu elemento anterior, atribua ao elemento anterior à variável *maior* e faça com que *n* volte 1 elemento no vetor.
```
    if(n>1 & maior < z(n-1))
        maior = z(n-1);
        n=n-1;
 ```
Se *n* for menor que o tamanho máximo do vetor *(ou seja: se ele nao for o último elemento do vetor - pois se fosse, ele avançaria a um elemento não existente e retornaria erro)* e seu valor for menor que o do elemento posterior, atribua o valor da frente à variável *maior* e faça com que *n* avance 1 elemento no vetor.
 ```
    elseif(n<size(z, "r") & maior < z(n+1))
        maior = z(n+1);
        n=n+1;
  ```
Caso o valor de *n* escolhido aleatoriamente seja 1, precisamos fazer com que ele verifique apenas o valor posterior; e caso este seja maior, avancar com a busca; caso contrário o algoritmo deve sair do laço e retornar o primeiro elemento como máximo local encontrado - encerrando sua execução.
 ```
    elseif(n==1)
        if(maior < z(n+1))
            maior = z(n+1);
            n=n+1;
        else
            disp(maior, n, "Máximo valor local da função: ");
            break
        end
 ```
Caso o valor de *n* escolhido aleatoriamento seja o do último elemento do vetor, precisamos fazer com que ele verifique apenas o valor anterior; e caso ele seja maior, continuar a busca; caso contrário o algoritmo sai do laço e retorna este último elemento como máximo local encontrado - encerrando sua execução.
```
    elseif(n==size(z, "r"))
        if(maior < z(n-1))
            maior = z(n-1);
            n=n-1;
        else
            disp(maior, n, "Máximo valor local da função: ");
            break
        end
 ```
 Caso o algoritmo encontre um valor que seja tanto maior que o seu valor anterior, quanto seu posterior, terá sido encontrado um máximo local; devendo esse valor ser retornado no console, o laço encerrado e o algoritmo finalizado.
 ```
    else
        disp(maior,n,"Máximo valor local da função: ");
        break
    end
end
```

## Discussão dos resultados obtidos

Ao executar o arquivo [questao1.sce](questao1.sce) no Scilab, podemos verificar basicamente duas ações: 
* A abertura da janela gráfica exibindo o gráfico da função da questão:

![grafico_q1](https://user-images.githubusercontent.com/51038132/65838269-cad03700-e2d7-11e9-9a1f-59569719ef10.png)

* O console irá retornar o valor máximo local encontrado:

![console_q1](https://user-images.githubusercontent.com/51038132/65838454-8a71b880-e2d9-11e9-844f-a746cb702366.png)

* A cada execução, como o hill climbing inicia em pontos aleatórios, podemos verificar que o algoritmo pode encontrar diferentes pontos máximos locais:

![console_q1_2](https://user-images.githubusercontent.com/51038132/65838467-c73daf80-e2d9-11e9-9026-72d3a7743170.png)

Desta forma, a cada execução, o algoritmo pode encontrar diferentes máximos locais, dependendo do valor *n* inicial.


## Questão 2

**Em desenvolvimento**

*Construa um programa baseado em lógica fuzzy (inferência de Mamdani) que receba três valores: pressão no pedal, velocidade da roda e velocidade do carro e que devolva a pressão no freio. Siga as regras disponibilizadas nos slides sobre Lógica Fuzzy.*

### Regras:

* Regra 1: SE a pressão no pedal do freio for média ENTÃO **aplicar** o freio.
* Regra 2: SE a pressão no pedal de freio for alta E a velocidade do carro for alta E a velocidade das rodas for alta ENTÃO **aplicar** o freio.
* Regra 3: SE a pressão no pedal de freio for alta E a velocidade do carro for alta E a velocidade das rodas for baixa ENTÃO **liberar** o freio.
* Regra 4: SE a pressão no pedal de freio for baixa ENTÃO **liberar** o freio.

## Questão 3

*Usando o conjunto de dados do aerogerador (variável de entrada: velocidade do vento – m/s, variável de saída: potência gerada – kWatts), determine os modelos de regressão polinomial (graus 2, 3, 4 e 5) com parâmetros estimados pelo método dos mínimos quadrados.
Avalie a qualidade de cada modelo pela métrica R2 e R2aj (equações 48 e 49, slides sobre Regressão Múltipla).*

### Iniciando 
Para a resolução desta questão e criação deste relatório foram usados os seguintes arquivos:

* [questao3.sce](questao3.sce) - Código-fonte da aplicação proposta na questão
* [aerogerador.dat](aerogerador.dat) - Dataset utilizado na questão
* [grafico_q3.png](grafico_q3.png) - Gráfico gerado pela aplicação durante a execução

## Código comentado

### Parte 1: Configuração inicial, e leitura dos dados
Primeiramente, o arquivo [aerogerador.dat](aerogerador.dat) foi lido pela aplicação e seus dados foram armazenados na matriz **MD**.
```
//-----------------------------------------------------------------------------
// Lê matriz de dados de número variável de linhas por 2 colunas
//-----------------------------------------------------------------------------
MD = read('aerogerador.dat', -1, 2);
```
### Parte 2: Definição do número de linhas da base de dados
Em seguida, foi atribuída a variável **m** o número total de linhas da base de dados para uso futuro.
```
//-----------------------------------------------------------------------------
// Determina o número de linhas da matriz
//-----------------------------------------------------------------------------
m=length(MD(:,1))
```
### Parte 3: Inicialização das variáveis usadas no método dos mínimos quadrados
Todas as variáveis usadas nas matrizes dos polinômios de graus 2, 3, 4 e 5 foram inicializadas e atribuído valor 0.
```
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
SYX4 = 0;   //Soma dos produtos de y pela quarta potencia de x
SYX5 = 0;   //Soma dos produtos de y pela quinta potencia de x
```
### Parte 4: Atribuição dos valores às variáveis
Todos os cálculos foram realizados por meio de um laço que percorre toda a matriz **MD** e os valores finais necessários ao método dos mínimos quadrados foram atribuídos às suas respectivas variáveis.
```
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
```
### Parte 5: Atribuição dos valores às variáveis
Nesta seção do código, foram montadas as matrizes de coeficientes assim como o vetor de termos independentes dos sistemas lineares utilizados nos polinômios de graus 2, 3, 4 e 5.
```
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
```

### Parte 6: Resolução dos sistemas
Os sistemas de equações de graus 2 a 5 foram resolvidos por meio de divisões à esquerda das matrizes de coeficientes pelos vetores de termos independentes e as soluções foram armazenadas nos vetores **S**, **T**, **U** e **V**.

```
// Resolve sistema de segundo grau com divisão à esquerda da matriz A pelo vetor b
S = A\b; 
// Resolve sistema de terceiro grau com divisão à esquerda da matriz C pelo vetor d
T = C\d;
// Resolve sistema de quarto grau com divisão à esquerda da matriz E pelo vetor f
U = E\f;
// Resolve sistema de quinto grau com divisão à esquerda da matriz G pelo vetor h
V = G\h; 
```

### Parte 7: Atribuições à variáveis de cada uma das soluções
Cada uma das soluções dos sistemas lineares foram armazenadas em uma variável distinta.

```
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
```
### Parte 8: Exibição dos resultados
Nesta penúltima (e maior) seção do código, exibiremos no console do SciLab todos os coeficientes das equações (*soluções dos sistemas lineares*), exibiremos a função encontrada e exibiremos os coeficientes de determinação e determinação ajustado, conforme solicitado na questão para cada um dos polinômios de graus 2 a 5.
```
//-----------------------------------------------------------------------------
// Exibe no console os resultados dos sistemas lineares encontrados,
// cria vetores de valores das funções e calcula os coeficientes de determinação
//-----------------------------------------------------------------------------

disp("-------POLINÔMIO DO SEGUNDO GRAU---------")
disp("a0 = " + string(a0)); //Exibe valor do termo independente da equação
disp("a1 = " + string(a1)); //Exibe valor do coeficiente de x da equação
disp("a2 = " + string(a2)); //Exibe valor do coeficiente de x² da equação
// Exibe a equação encontrada y
disp("Equação da reta Y = " + string(a0) + " + " + string(a1) + "x" + " + " + string(a2) + "x^2");
// Atribui a um vetor os valores encontrados
y = a0 + (a1*(MD(:,1))) + (a2*(MD(:,1)^2));

//-----------------------------------------------------------------------------
//Coeficiente de determinação do polinômio de grau 2

y_estrela = MD(:,2);        // Valor de y da base de dados
y_media = mean(y_estrela);  // Média dos valores de y da base de dados

SQE = 0;    // Quadrado soma das diferenças entre o valor da função e a média
SYY = 0;    // Quadrado soma das diferenças entre o valor real e a média

//Determina os valores de SQE e SYY
for j=1:m do
    SQE = SQE + ((y(j) - y_media)^2);
    SYY = SYY + ((y_estrela(j) - y_media)^2);
end

// Calcula o valor do coeficiente de determinação
R22 = (SQE/SYY);
// Exibe o coeficiente de determinação no console
disp("Coeficiente de determinação R2 = " + string(R22));

// Coeficiente de determinação ajustado
k = size(MD, 'c'); // numero de colunas da base de dados
p = k + 1;
R22aj = 1-((1-R22).*((m-1)/(m-p))); // Valor de R2 ajustado
disp("Coeficiente de determinação ajustado R2aj = " + string(R22aj));

//-----------------------------------------------------------------------------

disp("-------POLINÔMIO DO TERCEIRO GRAU---------")
disp("b0 = " + string(b0)); //Exibe valor do termo independente da equação
disp("b1 = " + string(b1)); //Exibe valor do coeficiente de x da equação
disp("b2 = " + string(b2)); //Exibe valor do coeficiente de x² da equação
disp("b3 = " + string(b3)); //Exibe valor do coeficiente de x³ da equação
// Exibe a equação encontrada y2
disp("Equação da reta Y = " + string(b0) + " + " + string(b1) + "x" + " + " + string(b2) + "x^2" + " + " + string(b3) + "x^3");
// Atribui a um vetor os valores encontrados
y2 = b0 + (b1*(MD(:,1))) + (b2*(MD(:,1)^2)) + (b3*(MD(:,1)^3));

//-----------------------------------------------------------------------------
//Coeficiente de determinação do polinômio de grau 3

y_estrela = MD(:,2);        // Valor de y da base de dados
y_media = mean(y_estrela);  // Média dos valores de y da base de dados

SQE = 0;    // Quadrado soma das diferenças entre o valor da função e a média
SYY = 0;    // Quadrado soma das diferenças entre o valor real e a média

//Determina os valores de SQE e SYY
for j=1:m do
    SQE = SQE + ((y2(j) - y_media)^2);
    SYY = SYY + ((y_estrela(j) - y_media)^2);
end

// Calcula o valor do coeficiente de determinação
R23 = (SQE/SYY);
// Exibe o coeficiente de determinação no console
disp("Coeficiente de determinação R2 = " + string(R23));

// Coeficiente de determinação ajustado
k = size(MD, 'c'); // numero de colunas da base de dados
p = k + 1;
R23aj = 1-((1-R23).*((m-1)/(m-p))); // Valor de R2 ajustado
disp("Coeficiente de determinação ajustado R2aj = " + string(R23aj));
//-----------------------------------------------------------------------------
disp("-------POLINÔMIO DO QUARTO GRAU---------")
disp("c0 = " + string(c0)); //Exibe valor do termo independente da equação
disp("c1 = " + string(c1)); //Exibe valor do coeficiente de x da equação
disp("c2 = " + string(c2)); //Exibe valor do coeficiente de x² da equação
disp("c3 = " + string(c3)); //Exibe valor do coeficiente de x³ da equação
disp("c4 = " + string(c4)); //Exibe valor do coeficiente de x⁴ da equação
// Exibe a equação encontrada y3
disp("Equação da reta Y = " + string(c0) + " + " + string(c1) + "x" + " + " + string(c2) + "x^2" + " + " + string(c3) + "x^3" + " + " + string(c4) + "x^4");
// Atribui a um vetor os valores encontrados
y3 = c0 + (c1*(MD(:,1))) + (c2*(MD(:,1)^2)) + (c3*(MD(:,1)^3)) + (c4*(MD(:,1)^4));

//-----------------------------------------------------------------------------
//Coeficiente de determinação do polinômio de grau 4

y_estrela = MD(:,2);        // Valor de y da base de dados
y_media = mean(y_estrela);  // Média dos valores de y da base de dados

SQE = 0;    // Quadrado soma das diferenças entre o valor da função e a média
SYY = 0;    // Quadrado soma das diferenças entre o valor real e a média

//Determina os valores de SQE e SYY
for j=1:m do
    SQE = SQE + ((y3(j) - y_media)^2);
    SYY = SYY + ((y_estrela(j) - y_media)^2);
end

// Calcula o valor do coeficiente de determinação
R24 = (SQE/SYY);
// Exibe o coeficiente de determinação no console
disp("Coeficiente de determinação R2 = " + string(R24));

// Coeficiente de determinação ajustado
k = size(MD, 'c'); // numero de colunas da base de dados
p = k + 1;
R24aj = 1-((1-R24).*((m-1)/(m-p))); // Valor de R2 ajustado
disp("Coeficiente de determinação ajustado R2aj = " + string(R24aj));
//-----------------------------------------------------------------------------

disp("-------POLINÔMIO DO QUINTO GRAU---------")
disp("d0 = " + string(d0)); //Exibe valor do termo independente da equação
disp("d1 = " + string(d1)); //Exibe valor do coeficiente de x da equação
disp("d2 = " + string(d2)); //Exibe valor do coeficiente de x² da equação
disp("d3 = " + string(d3)); //Exibe valor do coeficiente de x³ da equação
disp("d4 = " + string(d4)); //Exibe valor do coeficiente de x⁴ da equação
disp("d5 = " + string(d5)); //Exibe valor do coeficiente de x⁵ da equação
// Exibe a equação da reta y
disp("Equação da reta Y = " + string(d0) + " + " + string(d1) + "x" + " + " + string(d2) + "x^2" + " + " + string(d3) + "x^3" + " + " + string(d4) + "x^4" + " + " + string(d5) + "x^5");
// Atribui a um vetor os valores encontrados
y4 = d0 + (d1*(MD(:,1))) + (d2*(MD(:,1)^2)) + (d3*(MD(:,1)^3)) + (d4*(MD(:,1)^4)) + (d5*(MD(:,1)^5));

//-----------------------------------------------------------------------------
//Coeficiente de determinação do polinômio de grau 5

y_estrela = MD(:,2);        // Valor de y da base de dados
y_media = mean(y_estrela);  // Média dos valores de y da base de dados

SQE = 0;    // Quadrado soma das diferenças entre o valor da função e a média
SYY = 0;    // Quadrado soma das diferenças entre o valor real e a média

//Determina os valores de SQE e SYY
for j=1:m do
    SQE = SQE + ((y4(j) - y_media)^2);
    SYY = SYY + ((y_estrela(j) - y_media)^2);
end

// Calcula o valor do coeficiente de determinação
R25 = (SQE/SYY);
// Exibe o coeficiente de determinação no console
disp("Coeficiente de determinação R2 = " + string(R25));

// Coeficiente de determinação ajustado
k = size(MD, 'c'); // numero de colunas da base de dados
p = k + 1;
R25aj = 1-((1-R25).*((m-1)/(m-p))); // Valor de R2 ajustado
disp("Coeficiente de determinação ajustado R2aj = " + string(R25aj));
//-----------------------------------------------------------------------------
```
### Parte 9: Plotagem dos gráficos
Na última parte do código, plotaremos os quatro gráficos em uma única janela.
```
clf; // Limpa a janela gráfica

//Plota o gráfico 1
subplot(221);
z = [2 67 54];
scatter(MD(:,1), MD(:, 2), 1, "scilabgreen4", ".");
plot2d(MD(:,1), y);
xlabel("Regressão polinomial de grau 2");

//Plota o gráfico 2
subplot(222);
scatter(MD(:,1), MD(:, 2), 1, "scilabblue2", ".");
plot2d(MD(:,1), y2);
xlabel("Regressão polinomial de grau 3");

//Plota o gráfico 3
subplot(223);
scatter(MD(:,1), MD(:, 2), 1, "scilabred2", ".");
plot2d(MD(:,1), y3);
xlabel("Regressão polinomial de grau 4");

//Plota o gráfico 4
subplot(224);
scatter(MD(:,1), MD(:, 2), 1, "scilabmagenta2", ".");
plot2d(MD(:,1), y4);
xlabel("Regressão polinomial de grau 5");

//Fim do programa
```

## Discussão dos resultados obtidos

Ao executar o arquivo [questao3.sce](questao3.sce) no Scilab, podemos verificar o seguinte comportamento: 
* A abertura da janela gráfica exibindo os gráfico de regressão dos polinômios de graus 2, 3, 4 e 5:

![grafico_q3](https://user-images.githubusercontent.com/51038132/66360911-1ecfc100-e953-11e9-9393-eeab230c123e.png)

* O console, por sua vez irá retornar os valores dos coeficientes das equações, a equação encontrada e os coeficientes de determinação (*R2*) e determinação ajustado (*R2aj*) para cada um dos quatro graus de polinômio:

![console_g2](https://user-images.githubusercontent.com/51038132/66361356-e8934100-e954-11e9-8331-7946f3b4a70e.png)

*Retorno do console do SciLab para o poliômio de grau 2*

![console_g3](https://user-images.githubusercontent.com/51038132/66361395-02cd1f00-e955-11e9-89bd-8a56a82e7da5.png)

*Retorno do console do SciLab para o poliômio de grau 3*

![console_g4](https://user-images.githubusercontent.com/51038132/66361413-0fea0e00-e955-11e9-928e-483545ec3eec.png)

*Retorno do console do SciLab para o poliômio de grau 4*

![console_g5](https://user-images.githubusercontent.com/51038132/66361427-1ed0c080-e955-11e9-9eaf-e3feeb576318.png)

*Retorno do console do SciLab para o poliômio de grau 5*

Ao analisar os gráficos lado a lado podemos perceber um ajuste cada vez maior da linha do gráfico de regressão conforme o grau dos polinômios aumentam, porém a partir do grau 5 o nível de melhora do ajuste é imperceptível a olho nu e ao observarmos os dados dos coeficientes de determinação podemos confirmar esse fato, uma vez que os graus de ajuste permanecem praticamente os mesmos.
