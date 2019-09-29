# Projetos de inteligência artificial
## Este repositório hospeda os trabalhos realizados durante os estudos de Inteligência Artificial

### 29/09/2019: Trabalho 1 de inteligência computacional

1. Encontre o máximo da função f(x,y) = |xsen(yπ/4) + ysen(xπ/4)| por meio do algoritmo hill-climbing. As variáveis x e y pertencem ao intervalo entre 0 e 20. Os vizinhos de determinado estado (x, y) são (x, y ± 0,01), (x ± 0,01, y) e (x ± 0,01, y ±
0,01). Por exemplo, os vizinhos do estado (1,00; 1,00) são (1,00; 1,01), (1,01; 1,01), (0,99; 0,99), (0,99; 1,00) etc.

2. Construa um programa baseado em lógica fuzzy (inferência de Mamdani) que receba três valores: pressão no pedal, velocidade da roda e velocidade do carro e que devolva a pressão no freio. Siga as regras disponibilizadas nos slides sobre Lógica Fuzzy.

3. Usando o conjunto de dados do aerogerador (variável de entrada: velocidade do vento – m/s, variável de saída: potência gerada – kWatts), determine os modelos de regressão polinomial (graus 2, 3, 4 e 5) com parâmetros estimados pelo método dos mínimos quadrados.
Avalie a qualidade de cada modelo pela métrica R2 e R2aj (equações 48 e 49, slides sobre Regressão Múltipla).

### Observações:

* Elabore um pequeno relatório sobre os resultados obtidos. 
* As implementações devem ser em C, Java, Python ou Matlab/Scilab. 

## Questão 1

### Iniciando 
Para a resolução desta questão foram usados dois arquivos:

* [questao1.sce](questao1.sce) - Código-fonte da aplicação proposta na questão
* *relatorio_q1.pdf* - Relatório descritivo dos resultados obtidos 

### Construído em

* [Scilab 6.0.2](https://www.scilab.org/) - Software open source para computação numérica
* [Linux Mint 19.2 Tina](https://www.linuxmint.com/) - Sistema operacional usado

## Autor

* **José Lopes de S. Filho** - [LinkedIn](https://www.linkedin.com/in/joselopesfilho/)

## Licença

Este projeto é licenciado sob a MIT License - ver o arquivo [LICENSE.md](LICENSE.md) para detalhes
