// PRIMEIRO TRABALHO DE INTELIGÊNCIA COMPUTACIONAL
// Questão 2
// Aluno: José Lopes de Souza Filho
// Matrícula: 389097
// Aplicação: Scilab, versão 6.0.2
// SO: Linux Mint 19.2 Tina
//-----------------------------------------------------------------------------

clear;  // Limpa as variáveis armazenadas
clc;    // Limpa o console

//-----------------------------------------------------------------------------
// RECEBE OS VALORES DE ENTRADA
//-----------------------------------------------------------------------------
pf = input("Digite a pressão do freio: ");          // Pressão no pedal do freio
vr = input("Digite a velocidade das rodas: ");      // Velocidade das rodas
vc = input("Digite a velocidade do carro: ");       // Velocidade do carro
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// TORNA NEBULOSOS OS VALORES DE ENTRADA (FUZZIFICAÇÃO)
//-----------------------------------------------------------------------------
// Para pressão dos freios alto (pfa)
if(pf >= 50)
    pfa = (pf / 50)-1;
else
    pfa = 0;
end
//-----------------------------------------------------------------------------
// Para pressão dos freios baixo (pfb)
if (pf <= 50)
    pfb = (-pf / 50) + 1;
else
    pfb = 0;
end
//-----------------------------------------------------------------------------
// Para pressão dos freios médio (pfm)
if (pf >= 30 && pf <= 50)
    pfm = (pf - 30) / 20;
elseif(pf > 50 && pf <= 70)
    pfm = (-pf + 70) / 20;
else
    pfm = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade da roda rápida (vrr)
if(vr >= 40)
    vrr = (vr - 40) / 60;
else
    vrr = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade da roda devagar (vrd)
if (vr <= 60)
    vrd = (-vr / 60) + 1;
else
    vrd = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade da roda média (vrm)
if (vr >= 20 && vr <= 50)
    vrm = (vr - 20) / 30;
elseif( vr > 50 && vr <= 80)
    vrm = (-vr + 80) / 30;
else
    vrm = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade do carro rápido (vcr)
if (vc >= 40)
    vcr = (vc - 40) / 60;
else
    vcr = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade do carro devagar (vcd)
if (vc <= 60)
    vcd = (-vc / 60) + 1;
else
    vcd = 0;
end
//-----------------------------------------------------------------------------
// Para velocidade do carro médio (vcm)
if (vc >= 20 && vc <= 50)
    vcm = (vc - 20) / 30;
elseif( vc > 50 && vc <= 80)
     vcm = (-vc + 80) / 30;
else
     vcm = 0;
end
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// APLICANDO AS REGRAS DE PRESSÃO E LIBERAÇÃO DOS FREIOS DA QUESTÃO
//-----------------------------------------------------------------------------

// Aplicação das regras 1 e 2 (Aplica os freios)
n = [pfa, vcr, vrr];
aperta = pfm + min(n);

// Aplicação das regras 3 e 4 (Libera os freios)
m = [pfa, vcr, vrd];
solta = pfb + min(m);

// Exibe os valores fuzzificados de pressão e liberação dos freios
disp("Valor fuzzificado da pressão dos freios: " + string(aperta));
disp("Valor fuzzificado da liberação dos freios: " + string(solta));

//-----------------------------------------------------------------------------
// DEFUZZIFICAÇÃO DAS INFORMAÇÕES (POR MEIO DA CENTRÓIDE)
//-----------------------------------------------------------------------------
num = 0;
den = 0;

// Encontra a centróide da função
i = 5;

while(i <= 100)
    b = i / 100;
    if(b < solta)
        num = num + (i * solta);
        den = den + solta;
    elseif(b > aperta)
        num = num + (i * aperta);
        den = den + aperta;
    else
        num = num + (i * b);
        den = den + b;
    end
    i = i + 5;
end

centroide = num / den;

// Exibe a centróide da função (defuzzifica)
disp("Valor defuzzificado a ser aplicado nos freios: " + string(centroide));

// Fim do programa
