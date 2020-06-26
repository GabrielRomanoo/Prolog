% 		  		 FORMATAÇÃO DOS FATOS
% nome, linguagem, nível, salário, regime, idade, regiao
%
% Integrantes do Grupo: Jaime Mathias, Gabriel Romano, Felipe Ferreira, Mauricio Freire

% FATOS 
candidato(gabriel, java, junior, 2000, clt, 19, sp).
candidato(jaime, javascript, junior, 3000, pj, 19, sp).
candidato(felipe, c, pleno, 4000, clt, 23, santos).
candidato(mauricio, java, pleno, 3500, pj, 27, pg).
candidato(ferrauche, python, senior, 8000, pj, 42, sp).
candidato(ciro, c, senior, 10000, pj, 50, santos).
candidato(zanini, c, junior, 1000, clt, 40, sv).
candidato(ygor, python, junior, 2500, clt, 20, sv).
candidato(fernando, java, senior, 6000, pj, 41, sp).
candidato(luis, python, junior, 2000, clt, 20, santos).
candidato(jonathan, cmaismais, pleno, 2500, clt, 21, sp).
candidato(ronaldo, c, senior, 6000, clt, 52, sv).
candidato(agata, javascript, junior, 1800, pj, 18, sp).
candidato(beatriz, java, pleno, 3000, pj, 24, sv).
candidato(julia, javascript, junior, 2200, pj, 21, pg).
candidato(matheus, cmaismais, pleno, 3500, pj, 30, santos).
candidato(luan, javascript, junior, 1500, pj, 17, pg).
candidato(lucas, python, senior, 5300, clt, 35, sp).
candidato(marcus, c, junior, 2300, pj, 20, sp).
candidato(guilherme, javascript, junior, 2000, pj, 19, sp).
candidato(rodrigo, java, pleno, 2000, pj, 20, santos).
candidato(mariana, c, senior, 6500, clt, 35, guaruja).
candidato(luana, python, junior, 1400, pj, 21, guaruja).
candidato(leandro, javascript, pleno, 3000, clt, 26, pg).
candidato(camila, python, pleno, 3500, pj, 27, pg).
candidato(livia, java, junior, 1800, pj, 18, guaruja).
candidato(selma, javascript, pleno, 2600, clt, 23, guaruja).
candidato(gabriela, c, senior, 7300, clt, 38, sv).
candidato(david, haskell, junior, 2000, pj, 23, sp).
candidato(matheus, python, pleno, 4000, clt, 35, sv).
candidato(renato, cobol, senior, 8000, pj, 70, sp).
candidato(enzo, javascript, junior, 1500, clt, 18, santos).
candidato(bastos, c, junior, 1000, clt, 19, sp).
candidato(adriano, javascript, junior, 5000, pj, 19, sp).
candidato(vitor, c, pleno, 4000, pj, 22, sv).
candidato(victor, javascript, senior, 5000, pj, 30, sp).
candidato(milton, java, senior, 7200, pj, 50, santos).
candidato(marcia, javascript, pleno, 3500, pj, 39, guaruja).
candidato(francisco, python, senior, 4900, clt, 44, sp).
candidato(henrique, javascript, senior, 5000, pj, 40, sp).

regiao(sp, sp).
regiao(sp, santos).
regiao(sp, guaruja).
regiao(sp, sv).
regiao(santos, santos).
regiao(santos, pg).
regiao(santos, guaruja).
regiao(santos, sv).
regiao(sv, sv).
regiao(sv, santos).
regiao(sv, guaruja).
regiao(sv, sp).
regiao(sv, pg).
regiao(pg, pg).
regiao(pg, santos).
regiao(pg, sv).
regiao(pg, guaruja).
regiao(guaruja, guaruja).
regiao(guaruja, santos).
regiao(guaruja, sv).
regiao(guaruja, pg).
regiao(guaruja, sp).

regime(clt).
regime(pj).

linguagem(c).
linguagem(python).
linguagem(javascript).
linguagem(java).
linguagem(cmaismais).
linguagem(haskell).
linguagem(cobol).

nivel(junior).
nivel(pleno).
nivel(senior).


%REGRAS
idades() :- candidato(NOME , _, _, _, _, IDADE, _), format("Nome do candidato: ~s \tIdade: ~d\n", [NOME, IDADE]), fail;true. 
cidades() :- candidato(NOME , _, _, _, _, _, CIDADE), format("Nome do candidato: ~s \tCidade: ~s\n", [NOME, CIDADE]), fail;true. 
regimes() :- candidato(NOME , _, _, _, REGIME, _, _), regime(REGIME), format("Nome do candidato: ~s \tRegime: ~s\n", [NOME, REGIME]), fail;true.
salarios() :- candidato(NOME, _, _, SALARIO, _, _, _), format("Nome do candidato: ~s \tSalario: ~d\n", [NOME, SALARIO]), fail;true.
niveis() :- candidato(NOME, _, NIVEL, _, _, _, _), nivel(NIVEL), format("Nome do candidato: ~s \tNivel: ~s\n", [NOME, NIVEL]), fail;true.
linguagens() :- candidato(NOME, LINGUAGEM, _, _, _, _, _), linguagem(LINGUAGEM), 
                         format("Nome do candidato: ~s \tLinguagem: ~s\n", [NOME, LINGUAGEM]), fail;true.
nomes() :- candidato(NOME, _, _, _, _, _, _), format("Nome do candidato: ~s\n", [NOME]), fail;true.

procurarPorCidade(X) :- regiao(X, X), candidato(NOME, LINGUAGEM, _, _, _, _, X), format("Nome do candidato: ~s\nLinguagem: ~s\n\n", [NOME, LINGUAGEM]), fail;true.
procurarPorLinguagem(X) :- linguagem(X), candidato(NOME, X, NIVEL, _, _, _, CIDADE), format("Nome do candidato: ~s\nNivel: ~s\nCidade: ~s\n\n", [NOME, NIVEL, CIDADE]), fail;true.
procurarPorNivel(X) :- nivel(X), candidato(NOME, LINGUAGEM, X, _, _, _, CIDADE), format("Nome do candidato: ~s\nLinguagem: ~s\nCidade: ~s\n\n", [NOME, LINGUAGEM, CIDADE]), fail;true.
procurarPorFaixaSalarial(X, Y) :- candidato(NOME, LINGUAGEM, _, SALARIO, _, _, CIDADE), SALARIO >= X, SALARIO =< Y, format("Nome do candidato: ~s\nLinguagem: ~s\nSalário: ~d\nCidade: ~s\n\n", [NOME, LINGUAGEM, SALARIO, CIDADE]), fail;true.
procurarPorFaixaEtaria(X, Y) :- candidato(NOME, LINGUAGEM, _, _, _, IDADE, CIDADE), IDADE >= X, IDADE =< Y, format("Nome: ~s\nLinguagem: ~s\nIdade: ~d\nCidade: ~s\n\n", [NOME, LINGUAGEM, IDADE, CIDADE]), fail;true.
procurarPorRegiao(X) :- candidato(NOME, LINGUAGEM, _, _, _, _, CIDADE), regiao(X, CIDADE), format("Nome do candidato: ~s\nLinguagem: ~s\nCidade: ~s\n\n", [NOME, LINGUAGEM, CIDADE]), fail;true.
procurarPorRegime(X) :- candidato(NOME, LINGUAGEM, _, _, X, _, CIDADE), format("Nome do candidato: ~s\nLinguagem: ~s\nCidade: ~s\n\n", [NOME, LINGUAGEM, CIDADE]), fail;true.

vaoAposentar() :- candidato(NOME , _, _, _, _, IDADE, _), IDADE > 50, format("Nome do candidato: ~s\n", [NOME]), fail;true.

qtdeCandidatosCidade(X) :- findall(X, candidato(_, _, _, _, _, _, X), R), length(R, Result), format("Tem ~d na candidatos na cidade de ~s\n", [Result, X]).
faixaSalarial() :- findall(X, candidato(_, _, _, X, _, _, _), R), min_member(MIN, R), max_member(MAX, R),
                   format("A faixa salarial dos candidatos é ~d - ~d", [MIN, MAX]).
qtdeCandidatos() :- findall(Z, candidato(Z, _, _, _, _, _, _), R), length(R, X), format("Tem ~d candidatos\n", [X]).


faixaEtaria() :- findall(X, candidato(_, _, _, _, _, X, _), R), min_member(MIN, R), max_member(MAX, R),
                   format("A faixa etária dos candidatos é ~d - ~d", [MIN, MAX]).

listaCidades(Result) :- findall(X, candidato(_, _, _, _, _, _, X), R), sort(R, Result).
listaDeCidades() :- listaCidades(Result), writeln(Result).

principaisCidades() :- findall(X, candidato(_, _, _, _, _, _, X), R), msort(R, Result), writeln(Result).		

melhoresCandidatos() :- format("Qual linguagem você gostaria?"), read(LINGUAGEM), linguagem(LINGUAGEM),
		      format("Qual nível de candidato você gostaria?"), read(NIVEL), nivel(NIVEL),
    		  format("Qual faixa de salario que você está disposto a pagar?\nEscrever primeiro o min depois o max, 'min' ENTER 'max'"), read(F1), read(F2),
    		  format("Qual o regime da sua empresa?"), read(REGIME), regime(REGIME),
    		  format("Qual a faixa de idade que você gostaria no candidato?\nEscrever primeiro o min depois o max, 'min' ENTER 'max'"), read(I1), read(I2),
    		  format("Qual a cidade da sua empresa?"), read(CIDADE), regiao(CIDADE, CIDADE),
    		  candidato(NOME, LINGUAGEM, NIVEL, SALARIO, REGIME, IDADE, REGIAO), SALARIO >= F1, SALARIO =< F2,
    																			 IDADE >= I1, IDADE =< I2,
    																			 regiao(CIDADE, REGIAO),
    		  format("\nNome: ~s\nSalario: ~d\nIdade: ~d\nCidade: ~s\n", [NOME, SALARIO, IDADE, CIDADE]), fail;true. 

infoCandidato(X) :- candidato(X, LG, NVL, SAL, REG, IDADE, CID), 
                    format("Lnguagem: ~s\nNivel: ~s\nSalário pretendido: ~d\nRegime pretendido: ~s\nIdade: ~d\nCidade: ~s\n\n", 
                    [LG, NVL, SAL, REG, IDADE, CID]).

verificar(X1, X2) :- (number(X1) -> X1 = X1;  X1 = 0), (number(X2) -> X2 = X2;  X2 = 100000). 
    
candidato(LINGUAGEM, NIVEL, MIN_SALARIO, MAX_SALARIO, REGIME, MIN_IDADE, MAX_IDADE, REGIAO) :- verificar(MIN_SALARIO, MAX_SALARIO), verificar(MIN_IDADE, MAX_IDADE),
    	 listaCidades(R), 
    	 candidato(NOME, LINGUAGEM, NIVEL, SALARIO, REGIME, IDADE, CIDADE), SALARIO >= MIN_SALARIO, SALARIO =< MAX_SALARIO, IDADE >= MIN_IDADE, IDADE =< MAX_IDADE,
    	 (member(REGIAO, R) -> regiao(REGIAO, CIDADE); true),
    	 format("\nNome: ~s\nLinguagem: ~s\nNível: ~s\nSalario: ~d\nRegime ~s\nIdade: ~d\nCidade: ~s\n", [NOME, LINGUAGEM, NIVEL, SALARIO, REGIME, IDADE, CIDADE]), fail;true. 

help() :- writeln("Menu de Ajuda"),
          writeln("OBS: Toda vez que escrever algo do tipo exemplo(X), o X tem que ser escrito em minúsculo;"),
          writeln("utilize: 'nomes' para saber o nome de todos os cadidatos;"),
          writeln("utilize: 'linguagens' para saber as linguagens de todos os candidatos;"),
          writeln("utilize: 'niveis' para saber os níveis de todos os candidatos;"),
          writeln("utilize: 'salarios' para saber os salários pretendidos de todos os candidatos;"),
          writeln("utilize: 'regimes' para saber os regimes de todos os candidatos;"),
          writeln("utilize: 'idades' para saber as idades de todos os candidatos;"),
    	  writeln("utilize: 'cidades' para saber as cidades de todos os candidatos;"),
	      writeln("utilize: 'listaDeCidades' para saber todas as cidades disponiveis;"),
          writeln("utilize: 'melhoresCandidatos' para saber quais são os melhores candidatos para sua empresa contratar;"),
    	  writeln("utilize: 'infoCandidato(NOME)' para saber todas as informações do candidato pelo nome;"),
    	  writeln("utilize: 'procurarPorCidade(CIDADE)', para saber os candidatos que moram em determinada cidade;"),
    	  writeln("utilize: 'procurarPorRegiao(REGIAO)', para saber os candidatos que moram em determinada região;"),
    	  writeln("utilize: 'procurarPorLinguagem(LINGUAGEM)', para saber os candidatos que conhecem essa linguagem;"),
     	  writeln("utilize: 'procurarPorNivel(NIVEL)', para saber os candidatos que são deste nível;"),
    	  writeln("utilize: 'procurarPorRegime(REGIME)', para saber os candidatos que preferem esse regime;"),
    	  writeln("utilize: 'procurarPorFaixaSalarial(MIN, MAX)', para saber os candidatos que estão nessa faixa salarial;"),
    	  writeln("utilize: 'procurarPorFaixaEtaria(MIN, MAX)', para saber os candidatos que estão nessa faixa etária;"),
    	  writeln("utilize: 'vaoAposentar' para saber quem está próximo de se aposentar;"),
          writeln("utilize: 'qtdeCandidatos' para saber a quantidade de candidatos;"),
		  writeln("utilize: 'qtdeCandidatosCidade(CIDADE)' para saber a quantidade de candidatos de uma determinada cidade;"),
    	  writeln("utilize: 'faixaEtaria' para saber a faixa etaria dos candidatos;"),
          writeln("utilize: 'faixaSalarial' para saber a faixa salarial dos candidatos;"),
		  writeln("utilize: 'principaisCidades' uma lista com todas as cidades dos candidatos;"),
    	  writeln("utilize: 'candidato(LINGUAGEM, NIVEL, MIN_SALARIO, MAX_SALARIO, REGIME, MIN_IDADE, MAX_IDADE, REGIAO)' 
          para obter informações dos candidatos de forma mais especifica, caso não queira especificar alguma característica apenas deixe como está.").



