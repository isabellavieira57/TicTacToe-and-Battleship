{  -----UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL-REI-----
		          Isabella Vieira Ferreira
		           Mônica Neli de Resende
	         Ciência da Computação - 1º período
			             01/07/2011                                      }



program batalha_naval;

uses crt;

Type matriz = array [1..10, 1..10]  of integer;

{------------------------------------------------------------------------
Procedimento da tela inicial.
------------------------------------------------------------------------}
procedure bem_vindo;
begin
    clrscr;
	
	textcolor (15);
	writeln ('--------------------------------------------------------------------------------');
	writeln(' ');
	gotoxy(35,4);
	textcolor (15);
	writeln('Bem Vindo!');
	writeln(' ');
	textcolor (15);
	writeln ('--------------------------------------------------------------------------------');
	writeln('');
	writeln('');

	
	gotoxy(20,6);
	textcolor (15);
	writeln('Batalha Naval - Instrucoes de como jogar');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	
	gotoxy (0,9);
	textcolor (15);
	writeln(' * Cada jogador devera cadastrar suas embarcacoes escolhendo as  posicoes');
	textcolor (15);
	writeln ('   da seguinte forma:  ');
	textcolor (15);
	writeln(' ');
	textcolor (15);
	writeln(' -> Vertical ou horizontal');
	textcolor (15);
	writeln(' -> Direita ou esquerda ');
	textcolor (15);
	writeln(' -> Para cima ou para baixo  ');
	textcolor (15);
	writeln(' -> Digitar as coordenadas com os numeros referentes a linha e coluna do');
	textcolor (15);
	writeln('    tabuleiro');
	writeln(' ');
	writeln(' ');
	textcolor (15);
	writeln(' * Cada jogador devera acertar as embarcacoes do adversario. ');
	writeln(' ');
	textcolor (15);
	writeln(' * Ganha o jogador que acertar todas as embarcacoes do adversario.');
	textcolor (15);
	writeln ('--------------------------------------------------------------------------------');
	textcolor (15);
	write('                Pressione qualquer tecla para continuar...');

	readkey;

end;

{-----------------------------------------------------------------------
Procedimento de cadastro de jogadores.
------------------------------------------------------------------------}
procedure jogadores (var jog1, jog2: string );
begin

	writeln ('--------------------------------------------------------------------------------');
	writeln(' ');
	gotoxy(35,2);
	textcolor (15);
	writeln('Batalha Naval');
	writeln ('--------------------------------------------------------------------------------');
	writeln('');
	writeln('');
	
	
        textcolor(10);
		write('Jogador 1 - Digite seu nome: ');
		readln(jog1);
		
		while ( jog1 = '') do
		begin
				write('Digite um nome valido: ');
				readln(jog1);
		end;
		
		writeln (' ');
		writeln (' ');
		writeln (' ');

		textcolor(9);
		write('Jogador 2 - Digite seu nome: ');
		readln(jog2);
		
		while ( jog2 = '') do
		begin
				write('Digite um nome valido: ');
				readln(jog2);
		end;

end;

{----------------------------------------------------------------------------------------------------------
Funcao para verifcacao se a esquerda  esta livre para a embarcacao passada
como parametro.
-------------------------------------------------------------------------------------------------------------}
Function verifica_esquerda (x, y: integer; m: matriz; n: integer): boolean;
var j, cont: integer;
		flag: boolean;

begin
				//Verificando a esquerda do posicao digitada - decrementa a coluna
				
				//Comeca da posicao digitada
				j:= y ;
				cont:= 0;
				flag:= false;
				
				//Comeca com a posicao digitada
				while (j >= 1) and (cont <> n) do
				begin
					If (m[x, j] = 1) then
					begin
						//Posicao ocupada
						flag:= true;
					end
					else cont:= cont + 1;
					
					j:= j - 1;
				end; { while da esquerda}
				
				//Se nao contem posicoes suficientes para armazenar o submarino ou alguma posicao ja esta ocupada				
				If (cont <> n ) or (flag=true) then
				begin
					//Para a esquerda nao da
					verifica_esquerda:= false;
				end
				else verifica_esquerda:= true;

end;

{----------------------------------------------------------------------------------------------------------
Funcao para verifcacao se a direita esta livre para a embarcacao passada
como parametro.
-------------------------------------------------------------------------------------------------------------}
function verifica_direita (x, y: integer; m: matriz; n: integer): boolean;
var j, cont: integer;
		flag: boolean;

begin
				//Verificando a direita da posicao digitada - incrementa a coluna
				cont:= 0;
				flag:= false;
				//Direita da posicao digitada
				j:= y;
				
				while (j < 11) and (cont <> n) do //Parar quando o cont = n
				begin
					If (m[x, j] = 1) then
					begin
						//Posicao ocupada
						flag:= true;
					end
					else cont:= cont + 1;
				
					j:= j + 1;
				end;
				
				//Se nao contem posicoes suficientes para armazenar o submarino ou alguma posicao ja esta ocupada
				If (cont <> n ) or (flag = true) then
				begin
					verifica_direita:= false;
				end
				else verifica_direita:= true;

end;

{----------------------------------------------------------------------------------------------------------
Funcao para verifcacao se acima esta livre para a embarcacao passada
como parametro.
-------------------------------------------------------------------------------------------------------------}
function verifica_acima (x, y: integer; m: matriz; n: integer): boolean;
var j,cont: integer;
		flag: boolean;

begin
				//Verificando para cima
				j:= x;
				cont:= 0;
				flag:= false;
				
				while (j >= 1 ) and (cont <> n) do
				begin
				
					If (m[j, y] = 1 ) then
					begin
						//Ocupado
						flag:= true;
					end
					else cont:= cont + 1;//Contando as vazias
					
					j:= j - 1;
					
				end;
				
				//Se nao for possivel colocar o submarino para cima
				If (cont <> n) or (flag = true) then
				begin
					verifica_acima:= false;
				end
				else verifica_acima:= true;


end;

{----------------------------------------------------------------------------------------------------------
Funcao para verifcacao se abaixo esta livre para a embarcacao passada
como parametro.
-------------------------------------------------------------------------------------------------------------}
function verifica_abaixo (x, y: integer; m: matriz; n: integer): boolean;
var j, cont: integer;
		flag: boolean;
begin
			//Verificando para baixo
			cont:= 0;
			flag:= false;
			j:= x;
			
			while (j < 11) and (cont <> n) do
			begin
				If (m[j, y] = 1 ) then 
				begin
					//Ocupado					
					flag:= true;					
				end
				else cont:= cont + 1;
				
				j:= j + 1;
				
			end;
			
			//Se nao for possivel colocar para baixo
			If (cont <> n) or (flag = true) then
			begin
				verifica_abaixo:= false;			
			end
			else verifica_abaixo:= true;

end;


{----------------------------------------------------------------------------------------------------------
Procedimento para inserir os submarinos horizontal e vertical - 3 posicoes
-------------------------------------------------------------------------------------------------------------}
procedure submarino (var m1: matriz; jog: string);
var posicao, opcao: char;
       i, j,  x, y, cont: integer;
       sair, esquerda, direita, cima, baixo: boolean;
       
begin
	
	for i:= 1 to 2 do
	begin
		
		sair := false;
		
		while (sair <> true) do
		begin
			clrscr;
			textcolor (15);
			writeln ('--------------------------------------------------------------------------------');
			writeln(' ');
			gotoxy(31,2);
			textcolor (15);
			writeln('CADASTRO DAS EMBARCACOES');
			writeln ('--------------------------------------------------------------------------------');
			writeln('');
			writeln('');
			
			gotoxy(32,4);
			writeln ('Jogador - ', jog);
			writeln (' ');
			writeln (' ');
			
			writeln ('-> Submarino ',i);
			writeln ('Horizontal ou vertical? (H / V)');
			readln (posicao);
			writeln ('Digite a Linha: ');
			readln (x);
			writeln ('Digite a Coluna: ');
			readln (y);
			writeln ('----------------------------------------------------------');
			
			//Se for escolhido a opcao horizontal - fixa a linha 
			If (posicao = 'h') or (posicao = 'H') then
			begin
			
				//Verificando a esquerda do posicao digitada - decrementa a coluna
				esquerda:= verifica_esquerda(x, y, m1, 3);
								
				//Verificando a direita da posicao digitada - incrementa a coluna
				direita:= verifica_direita(x, y, m1, 3);
				
				//Se for possivel colocar na esquerda e na direita 
				If (esquerda = true) and (direita = true) then
				begin
						writeln ('Esquerda ou direita? (E/ D)');
						readln (opcao);
						
						esquerda:= false;
						direita:= false;
						sair:= true;
						
						//Coloca o submarino na esquerda
						If (opcao = 'E') or (opcao = 'e') then
						begin
							j:= y;
							cont:= 0;
							
							//Para quando preenche as 3 posicoes do submarino - esquerda
							while (cont <> 3) do
							begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
							end;
							
							writeln('Submarino colocado com sucesso!');
						
						end;{do if da esquerda}
						
						If (opcao = 'D') or (opcao = 'd') then
						begin
							j:= y;
							cont:= 0;
							
							//Para  preencher as 3 posicoes do submarino - direita
							while (cont <> 3) do
							begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
							end;
							
							writeln('Submarino colocado com sucesso!');							
							readkey;
							
						end;{ Do if da direita}
						
				end;{If onde a esquerda e direita sao possiveis}
				
				//Se apenas uma orientacao (direita / esquerda) for possivel - coloca nela direto
				
				//Se apenas a esquerda for possivel
				If (esquerda = true ) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preenche as 3 posicoes do submarino - esquerda
						while (cont <> 3) do
						begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
						end;
						
						writeln('Submarino colocado com sucesso!');											
						readkey;
				
				end;{do if de apenas esquerda}
				
				//Se apenas a direita for possivel
				If (direita = true) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preencher as 3 posicoes do submarino - direita
						while (cont <> 3) do
						begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
						end;					
						
							writeln('Submarino colocado com sucesso!');
							Readkey;
							
						
				end;
				
				If (sair = false) then
				begin
				clrscr;
				
				writeln('Nao foi possivel colocar o submarino na posicao desejada!');
				Readkey;
				
				end;
				
			end;{End do if de horizontal}
			
			//Se for vertical - Fixa a coluna 
			If (posicao = 'v') or (posicao = 'V') then
			begin
				
				//Verificando para cima
				cima:= verifica_acima(x, y, m1, 3);
			
				//Verificando para baixo
				baixo:= verifica_abaixo(x, y, m1, 3);
			
			//Se for possivel colocar para cima ou para baixo
			If (cima = true) and (baixo = true) then
			begin
				
				Writeln('Para Cima ou para Baixo - C / B');
				readln(opcao);
				
				sair:= true;
				cima:= false;
				baixo:= false;
				
				If (opcao = 'C') or (opcao = 'c') then
				begin
					j:= x;
					cont:= 0;
					
					while(cont <> 3) do
					begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
					end;	
					
					writeln('Submarino colocado som sucesso!');
					Readkey;
					
				end;{End da opcao cima- decrementa}
				
				If (opcao = 'B' ) or (opcao = 'b') then
				begin
					j:= x;
					cont:= 0;
					
					while (cont <> 3) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;					
					end;
					
					writeln('Submarino colocado som sucesso!');
					Readkey;					
					
				end; {End do if de para baixo}
								
			end; {If dos dois possiveis - para cima e para baixo}
			
			If (cima = true) then
			begin
				j:= x;
				cont:= 0;
				sair:= true;
					
				while(cont <> 3) do
				begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
				end;					
				
				writeln('Submarino colocado com sucesso!');
				Readkey;				
				
			end;
			
			If (baixo = true) then
			begin
					j:= x;
					cont:= 0;
					sair:= true;
					
					while (cont <> 3) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;
					end;			
				
					writeln('Submarino colocado com sucesso!');
					Readkey;			
			
			end;
			
			//Se nao for possivel nenhum
			If (sair = false) then
			begin
					clrscr;
							
					writeln('Nao foi possivel colocar o submarino na posicao desejada!');
					Readkey;
							
			end;			
			
			end;{End do if do vertical}
		
		end; {While de digitar um valor certo}
		
	
	end;{for dos 2 dos dois submarinos}


end;


{-------------------------------------------------------------------------------------------------------------
Procedimento para inserir um porta- avioes na horizontal e vertical - 5 posicoes
---------------------------------------------------------------------------------------------------------------}
procedure porta_avioes (var m1: matriz; jog: string);
var posicao, opcao: char;
        j,  x, y, cont: integer;
       sair, esquerda, direita,baixo,cima: boolean;
       
    
begin
	
		sair := false;
		
		while (sair <> true) do
		begin
			clrscr;
			textcolor (15);
			writeln ('--------------------------------------------------------------------------------');
			writeln(' ');
			gotoxy(31,2);
			textcolor (15);
			writeln('CADASTRO DAS EMBARCACOES');
			writeln ('--------------------------------------------------------------------------------');
			writeln('');
			writeln('');
			
			gotoxy(32,4);
			writeln ('Jogador - ', jog);
			writeln (' ');
			writeln (' ');
			
			writeln ('-> Porta - avioes ');
			writeln ('Horizontal ou vertical? (H / V)');
			readln (posicao);
			writeln ('Digite a Linha: ');
			readln (x);
			writeln ('Digite a Coluna: ');
			readln (y);
			writeln ('----------------------------------------------------------');
			

			
			//Se for escolhido a opcao horizontal - fixa a linha 
			If (posicao = 'h') or (posicao = 'H') then
			begin
			
				//Verificando a esquerda do posicao digitada - decrementa a coluna
				esquerda:= verifica_esquerda(x, y, m1, 5);
				
				//Verificando a direita da posicao digitada - incrementa a coluna
				direita:= verifica_direita(x, y, m1, 5);
				
				//Se for possivel colocar na esquerda e na direita 
				If (esquerda = true) and (direita = true) then
				begin
						writeln ('Esquerda ou direita? (E/ D)');
						readln (opcao);
						
						esquerda:= false;
						direita:= false;
						sair:= true;
						
						//Coloca o porta - avioes na esquerda
						If (opcao = 'E') or (opcao = 'e') then
						begin
							j:= y;
							cont:= 0;
							
							//Para quando preenche as 5 posicoes do porta - avioes- esquerda
							while (cont <> 5) do
							begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
							end;
							
							writeln('Porta - avioes colocado com sucesso!');
							readkey;
						
						end;{do if da esquerda}
						
						If (opcao = 'D') or (opcao = 'd') then
						begin
							j:= y;
							cont:= 0;
							
							//Para quando preencher as 5 posicoes do porta - avioes - direita
							while (cont <> 5) do
							begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
							end;
							
							writeln('Porta - avioes colocado com sucesso!');							
							readkey;
							
						end;{ Do if da direita}
						
				end;{If onde a esquerda e direita sao possiveis}
				
				//Se apenas uma orientacao (direita / esquerda) for possivel - coloca nela
				
				//Se apenas a esquerda for possivel
				If (esquerda = true ) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preenche as 5 posicoes do porta - avioes - esquerda
						while (cont <> 5) do
						begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
						end;
						
						writeln('Porta - avioes colocado com sucesso!');											
						readkey;
				
				end;{do if de apenas esquerda}
				
				//Se apenas a direita for possivel
				If (direita = true) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preencher as 5 posicoes do porta - avioes - direita
						while (cont <> 5) do
						begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
						end;					
						
							writeln('Porta - avioes colocado com sucesso!');
							Readkey;
							
						
				end;
				
				If (sair = false) then
				begin
				clrscr;
				
				writeln('Nao foi possivel colocar o porta - avioes na posicao desejada!');
				Readkey;
				
				end;
				
			end;{End do if de horizontal}
			
			//Se for vertical - Fixa a coluna 
			If (posicao = 'v') or (posicao = 'V') then
			begin
				
				//Verificando para cima
				cima:= verifica_acima(x, y, m1, 5);
			
				//Verificando para baixo
				baixo:= verifica_abaixo(x, y, m1, 5);
			
			//Se for possivel colocar para cima ou para baixo
			If (cima = true) and (baixo = true) then
			begin
				
				Writeln('Para Cima ou para Baixo - C / B');
				readln(opcao);
				
				sair:= true;
				cima:= false;
				baixo:= false;
				
				If (opcao = 'C') or (opcao = 'c') then
				begin
					j:= x;
					cont:= 0;
					
					while(cont <> 5) do
					begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
					end;	
					
					writeln('Porta - avioes colocado som sucesso!');
					Readkey;
					
				end;{End da opcao cima- decrementa}
				
				If (opcao = 'B' ) or (opcao = 'b') then
				begin
					j:= x;
					cont:= 0;
					
					while (cont <> 5) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;					
					end;
					
					writeln('Porta - avioes colocado som sucesso!');
					Readkey;					
					
				end; {End do if de para baixo}
								
			end; {If dos dois possiveis - para cima e para baixo}
			
			If (cima = true) then
			begin
				j:= x;
				cont:= 0;
				sair:= true;
					
				while(cont <> 5) do
				begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
				end;					
				
				writeln('Porta - avioes colocado com sucesso!');
				Readkey;				
				
			end;
			
			If (baixo = true) then
			begin
					j:= x;
					cont:= 0;
					sair:= true;
					
					while (cont <> 5) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;
					end;			
				
					writeln('Porta - avioes colocado com sucesso!');
					Readkey;			
			
			end;
			
			//Se nao for possivel nenhum
			If (sair = false) then
			begin
					clrscr;
							
					writeln('Nao foi possivel colocar o porta - avioes na posicao desejada!');
					Readkey;
							
			end;			
			
			end;{End do if do vertical}
		
		end; {While de digitar um valor certo}
		
end;


{---------------------------------------------------------------------------------------------------------
Procedimento para inserir dois navios na horizontal ou vertical - 2 posicoes
----------------------------------------------------------------------------------------------------------}
procedure navio (var m1: matriz; jog: string);
var posicao, opcao: char;
       i, j,  x, y, cont: integer;
       sair, esquerda, direita,baixo,cima: boolean;
       
begin
	
	for i:= 1 to 2 do
	begin
		
		sair := false;
		
		while (sair <> true) do
		begin
			clrscr;
			textcolor (15);
			writeln ('--------------------------------------------------------------------------------');
			writeln(' ');
			gotoxy(31,2);
			textcolor (15);
			writeln('CADASTRO DAS EMBARCACOES');
			writeln ('--------------------------------------------------------------------------------');
			writeln('');
			writeln('');
			
			gotoxy(32,4);
			writeln ('Jogador - ', jog);
			writeln (' ');
			writeln (' ');
			
			writeln ('-> Navio ',i);
			writeln ('Horizontal ou vertical? (H / V)');
			readln (posicao);
			writeln ('Digite a Linha: ');
			readln (x);
			writeln ('Digite a Coluna: ');
			readln (y);
			writeln ('----------------------------------------------------------');
			
			//Se for escolhido a opcao horizontal - fixa a linha 
			If (posicao = 'h') or (posicao = 'H') then
			begin
			
				//Verificando a esquerda do posicao digitada - decrementa a coluna
				esquerda:= verifica_esquerda(x, y, m1, 2);
				
				//Verificando a direita da posicao digitada - incrementa a coluna
				direita:= verifica_direita(x, y, m1, 2);
				
				//Se for possivel colocar na esquerda e na direita 
				If (esquerda = true) and (direita = true) then
				begin
						writeln ('Esquerda ou direita? (E/ D)');
						readln (opcao);
						
						esquerda:= false;
						direita:= false;
						sair:= true;
						
						//Coloca o submarino na esquerda
						If (opcao = 'E') or (opcao = 'e') then
						begin
							j:= y;
							cont:= 0;
							
							//Para quando preenche as 2 posicoes do navio - esquerda
							while (cont <> 2) do
							begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
							end;
							
							writeln('Navio colocado som sucesso!');
						
						end;{do if da esquerda}
						
						If (opcao = 'D') or (opcao = 'd') then
						begin
							j:= y;
							cont:= 0;
							
							//Para quando preencher as 2 posicoes do navio - direita
							while (cont <> 2) do
							begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
							end;
							
							writeln('Navio colocado com sucesso!');							
							readkey;
							
						end;{ Do if da direita}
						
				end;{If onde a esquerda e direita sao possiveis}
				
				//Se apenas uma orientacao (direita / esquerda) for possivel - coloca nela
				
				//Se apenas a esquerda for possivel
				If (esquerda = true ) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preenche as 2 posicoes do navio - esquerda
						while (cont <> 2) do
						begin
								m1[x , j]:= 1;
								j:= j -1;
								cont:= cont + 1;
						end;
						
						writeln('Navio colocado com sucesso!');											
						readkey;
				
				end;{do if de apenas esquerda}
				
				//Se apenas a direita for possivel
				If (direita = true) then
				begin
						j:= y;
						cont:= 0;
						sair:= true;
							
						//Para quando preencher as 2 posicoes do navio - direita
						while (cont <> 2) do
						begin
								m1[x, j]:= 1;
								j:= j + 1;
								cont:= cont + 1;
						end;					
						
							writeln('Navio colocado com sucesso!');
							Readkey;
							
						
				end;
				
				If (sair = false) then
				begin
				clrscr;
				
				writeln('Nao foi possivel colocar o navio na posicao desejada!');
				Readkey;
				
				end;
				
			end;{End do if de horizontal}
			
			//Se for vertical - Fixa a coluna 
			If (posicao = 'v') or (posicao = 'V') then
			begin
				
				//Verificando para cima
				cima:= verifica_acima(x, y, m1, 2);
			
				//Verificando para baixo
				baixo:= verifica_abaixo(x, y, m1, 2);
			
			//Se for possivel colocar para cima ou para baixo
			If (cima = true) and (baixo = true) then
			begin
				
				Writeln('Para Cima ou para Baixo - C / B');
				readln(opcao);
				
				sair:= true;
				cima:= false;
				baixo:= false;
				
				If (opcao = 'C') or (opcao = 'c') then
				begin
					j:= x;
					cont:= 0;
					
					while(cont <> 2) do
					begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
					end;	
					
					writeln('Navio colocado som sucesso!');
					Readkey;
					
				end;{End da opcao cima- decrementa}
				
				If (opcao = 'B' ) or (opcao = 'b') then
				begin
					j:= x;
					cont:= 0;
					
					while (cont <> 2) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;					
					end;
					
					writeln('Navio colocado com sucesso!');
					Readkey;					
					
				end; {End do if de para baixo}
								
			end; {If dos dois possiveis - para cima e para baixo}
			
			If (cima = true) then
			begin
				j:= x;
				cont:= 0;
				sair:= true;
					
				while(cont <> 2) do
				begin
						m1[j, y]:= 1;
						j:= j - 1;
						cont:= cont + 1;					
				end;					
				
				writeln('Navio colocado com sucesso!');
				Readkey;				
				
			end;
			
			If (baixo = true) then
			begin
					j:= x;
					cont:= 0;
					sair:= true;
					
					while (cont <> 2) do
					begin
						m1[j, y]:= 1;
						j:= j +1;
						cont:= cont +1;
					end;			
				
					writeln('Navio colocado com sucesso!');
					Readkey;			
			
			end;
			
			//Se nao for possivel nenhum
			If (sair = false) then
			begin
					clrscr;
							
					writeln('Nao foi possivel colocar o navio na posicao desejada!');
					Readkey;
							
			end;			
			
			end;{End do if do vertical}
		
		end; {While de digitar um valor certo}
		
	
	end;{for dos 2 dos dois submarinos}


end;

{---------------------------------------------------------------------------------------
Procedimento para inserir dois botes  na horizontal - 1 posicao
---------------------------------------------------------------------------------------}
procedure bote (var m1: matriz; jog: string);
var i,  x, y: integer;
       sair : boolean;
       
begin
	
	for i:= 1 to 2 do
	begin
		sair:= false;
			
			//Enquanto a opcao digitada nao for valida
			while (sair <> true) do
			begin
				clrscr;
				textcolor (15);
				writeln ('--------------------------------------------------------------------------------');
				writeln(' ');
				gotoxy(31,2);
				textcolor (15);
				writeln('CADASTRO DAS EMBARCACOES');
				writeln ('--------------------------------------------------------------------------------');
				writeln('');
				writeln('');
				
				gotoxy(32,4);
				writeln ('Jogador - ', jog);
				writeln (' ');
				writeln (' ');
				
				writeln ('-> Bote ',i);
				writeln ('Digite a Linha: ');
				readln (x);
				writeln ('Digite a Coluna: ');
				readln (y);
				writeln ('----------------------------------------------------------');
				
				//Se a matriz nao estiver ocupada...
				if (m1[x,y] = 0) then
				begin
						writeln('Bote colocado com sucesso!');	
						sair:= true;
						m1 [x,y]:= 1;
						readkey;
				end
				else
				begin
					writeln ('Nao foi possivel colocar o bote na posicao desejada');
					sair:= false;
					readkey;
				end;
			end; // while
		end; //for 
end;

{-----------------------------------------------------------------------
Funcao que verifica quem ganhou.
------------------------------------------------------------------------}
function verifica_ganhador (m1: matriz): boolean;
var i,j: integer;

begin
	//Se ainda tiver 1 na matriz, e pq ainda tem embarcacoes, entao retorna falso
	verifica_ganhador:= true;//vazia
	
	for i:= 1 to 10 do
	begin
		for j:= 1 to 10 do
		begin
			//Se ainda tiver alguma embarcacao sem atacar
			if (m1[i,j] = 1) then
			begin
				verifica_ganhador:= false;
			end;
					
		end;
	end;
		
end;

{---------------------------------------------------------------------------------------------------
Procedimento se a posicao ao lado posicao digitada, ou seja, 
para contar as partes da embarcacao a esquerda.
* ---------------------------------------------------------------------------------------------------}
procedure esquerda (x, y: integer; m: matriz; var cont1: integer );//sem contar a posicao digitada
var  j: integer;
		sair: boolean;

begin

	//Verificando a esquerda da posicao digitada
	if (m[x, (y - 1)] = 1) or (m[x, (y - 1)] = -1)then  
	begin
		j:= y - 2 ;
		//Contando com esse (esquerda da digitada)
		cont1:= 1;
		sair:= false;
				
		while (j >= 1) and (sair <> true) do
		begin
				//Verifica se a esquerda desse tem outro
				If (m[x, j] = 1) or  (m[x, j] = -1)then
				begin
						cont1:= cont1 + 1;
				end
				else  sair:= true; //Fim da embarcacao
					
				j:= j - 1;
		end; { while da esquerda}
	end;

end;

{---------------------------------------------------------------------------------------------------
Procedimento se a posicao ao lado posicao digitada, ou seja, 
para contar as partes da embarcacao  a direita.
* ---------------------------------------------------------------------------------------------------}
procedure direita (x, y: integer; m: matriz; var cont1: integer); // sem contar a posicao digitada
var j: integer;
		sair: boolean;

begin
	//verificando a direita da posicao digitada
	if (m[x, (y + 1)] = 1) or (m[x, (y + 1)] = -1) then  
	begin
		//Verificando a direita do posicao digitada - incrementa a coluna
		//Proxima a coluna digitada
		j:= y + 2 ;
		cont1:= 1;
		sair:= false;
				
		while (j < 11) and (sair <> true) do
		begin
				If (m[x, j] = 1) or (m[x, j] = -1) then
				begin
						cont1:= cont1 + 1;
				end
				else  sair:= true; //Fim da embarcacao
					
				j:= j + 1;
		end; { while da direita}
		
	end;

end;

{---------------------------------------------------------------------------------------------------
Procedimento se a posicao acima da atacada , ou seja, 
para contar as partes da embarcacao a cima.
---------------------------------------------------------------------------------------------------}
procedure cima (x, y: integer; m: matriz; var cont1: integer);  //sem contar a posicao digitada
var j: integer;
		sair: boolean;

begin
	//Verificando acima da posicao digitada
	If (m[(x - 1), y] = 1) or (m[(x - 1), y] = -1) then
	begin
		//Verificando acima da posicao digitada - decrementa a linha
		//Acima da linha digitada
		j:= x - 2 ;
		cont1:= 1;
		sair:= false;
				
		while (j >= 1) and (sair <> true) do
		begin
				If (m[j, y] = 1) or (m[j, y] = -1) then
				begin
						cont1:= cont1 + 1;
				end
				else  sair:= true; //Fim da embarcacao
					
				j:= j - 1;
		end; { while da posicao acima}	
	
	end;


end;

{---------------------------------------------------------------------------------------------------
Procedimento se a posicao abaixo da atacada , ou seja, 
para contar as partes da embarcacao abaixo.
---------------------------------------------------------------------------------------------------}
procedure abaixo (x, y: integer; m: matriz; var cont1: integer); //Sem contar a posicao digitada
var j: integer;
		sair: boolean;
		
begin
	//Verificando abaixo da posicao digitada
	If (m[(x + 1), y] = 1) or (m[(x+1), y] = -1)then
	begin
		//Verificando para baixo
		cont1:= 1;
		sair:= false;
		j:= x + 2;
			
		while (j < 11) and (sair <> true) do
		begin
			If (m[j, y] = 1 ) or (m[j, y] = -1) then 
			begin
				cont1:= cont1 + 1;				
			end
			else 
			begin
				sair:= false;
			end;
				
			j:= j + 1;
				
		end;	
	end;


end;
		




{---------------------------------------------------------------------------------------------------
Procedimento responsavel por informar qual embarcacao foi atacada.
* ---------------------------------------------------------------------------------------------------}
function embarcacoes (x, y : integer; m: matriz) : string ;
var cont, cont1: integer;

		
begin
		//cont1 recebe o numero de partes pela esquerda e da direita
		//cont soma todas as partes
		cont:= 0;
		cont1:= 0;

		//Se tiver partes a esquerda ou a direita (acertadas ou nao) -> horizontal
		If ((m[x, (y - 1)] = 1) or (m[x, (y - 1)] = -1) )or ((m[x, (y + 1)] = 1) or (m[x, (y + 1)] = -1)) then
		begin

				//Verificando as partes da esquerda
				If ((m[x, (y - 1)] = 1) or (m[x, (y - 1)] = -1) ) then
				begin
						esquerda(x, y, m, cont1);//com excecao da propria posicao digitada
				end;
				
				cont:= cont1;
				cont1:= 0;
				
				//Verificando as partes da direita
				 If (m[x, (y + 1)] = 1) or (m[x, (y + 1)] = -1) then
				 begin
						direita(x, y, m, cont1); //Com excecao da propria posicao digitada
				 end;	
				 
				
				//Somando as partes da esquerda, direita e a propria posicao digitada
				cont:= cont + cont1 +1;
				cont1:= 0;
				
		
		end		 { end do horizontal}
         else
         //Se for para cima ou para baixo(atacada ou nao) -> vertical
		 If ((m[(x -1), y ] = 1) or (m[(x -1), y ] = -1) )or ((m[(x + 1), y] = 1) or (m[(x + 1),y] = -1)) then
         begin
			
			//Verificando para cima
			 If (m[(x -1), y ] = 1) or (m[(x -1), y ] = -1)  then
			 begin
				cima(x, y, m, cont1);			 
			 end;
			 
	 
			 cont:= cont1;
			 cont1:= 0;
			 
			 //Verificando abaixo
			 If  (m[(x + 1), y] = 1) or (m[(x + 1),y] = -1) then
			 begin
				abaixo(x, y, m, cont1);
			 end;			
			
			//Somando as partes de acima e abaixo e a propria posicao digitada
			cont:= cont + cont1 + 1;
			cont1:= 0;
			
		
         end{end do vertical}
         else
         //Se nao tiver direita, esquerda, para cima e nem para baixo 
         begin
				//Bote - uma posicao
         		cont:= 1;
         end;
		
	//Funcao recebe o nome da embarcacao atacada
	If (cont = 3) then
	begin
		embarcacoes:= 'Submarino';
	end
	else 
	if (cont = 5) then
	begin
		embarcacoes:= 'Porta-aviao';
	end
	else
	If (cont = 2) then
	begin
		embarcacoes:= 'Navio';
	end
	else 
	If (cont = 1) then
	begin
		embarcacoes:= 'Bote';
	end
	else 
	begin
		//se tiver embarcacoes  coladas uma na outra
		embarcacoes:= 'Embarcacao nao identificada';
	end;
	
end;//Fim do procedimento embarcacoes


{--------------------------------------------------------------------------------
Procedimento responsavel pela analise das jogadas.
Se a posicao na matriz for 0 = tiro na agua
Se a posicao na matriz for 1 = embarcacao
Quando acerta a embarcacao coloca -1
-------------------------------------------------------------------------------------}
procedure jogadas (var m1, m2: matriz; var jog1,jog2: string);
var i,j,cont : integer;
	   parar, acertou: boolean;
	   jog_atual, embar: string;
	   m_atual: matriz;
	   
begin
		
		acertou:= false;
		parar:= verifica_ganhador(m1);//Matriz do primeiro jogador ainda intacta
		
		 //Comecar do jogador 1
		 cont:= 1;
		 
		//Enquanto o jogo nao acabar...roda!
		while (parar <> true) do
		begin

			clrscr;
			
			//Cabeçalho
			textcolor (15);
			writeln ('--------------------------------------------------------------------------------');
			writeln(' ');
			gotoxy(31,2);
			textcolor (15);
			writeln('JOGADAS');
			writeln ('--------------------------------------------------------------------------------');
			writeln('');
			writeln('');
		
            //Alternancia entre os jogadores
			If (cont = 1) then
			begin
				jog_atual:= jog1;
				cont:= cont + 1;
				
				//Matriz atual recebe a matriz do segundo  jogador
				for i:= 1 to 10 do
				begin
					for j:= 1 to 10 do
					begin
						m_atual[i, j]:= m2[i, j];
					end;
				end;	
				
			end
			else			
			if (cont = 2) then
			begin
				jog_atual:= jog2;
				cont:= cont - 1;
				
				//Matriz atual recebe a matriz do segundo primeiro jogador
				for i:= 1 to 10 do
				begin
					for j:= 1 to 10 do
					begin
						m_atual[i, j]:= m1[i, j];
					end;
				end;				
				
			end;   
			
			//Imprime nome do jogador
			gotoxy(32,4);
			writeln ('Jogador - ', jog_atual);
			writeln (' ');
			writeln (' ');
		
		
			writeln ('Digite a linha para atacar: ');
			readln (i);
			writeln ('Digite a coluna para atacar: ');
			readln (j);
			writeln ('----------------------------------------------------------');
			
		
			//Se a posicao na matriz for 0, e pq tem agua
			if (m_atual[i,j] = 0) then
			begin
				writeln ('Agua, nenhuma embarcacao no local');
				m_atual[i,j]:=-1;
				
				//Atribuindo na matriz original do jogador atual				
				If  ( cont = 1) then
				begin
					m1[i, j]:= -1;
				end
				else
				begin
					m2[i, j]:= -1;
				end;
				
				readkey;
			end
			else			
			if (m_atual[i,j] = -1) then
			begin
					writeln ('Essa posicao ja foi acertada em outra jogada');
					readkey;
			end
			else			
			 if (m_atual[i,j] = 1) then
			begin
			
				embar:= embarcacoes(i, j, m_atual);
				writeln ('Voce acertou um ', embar);//INFORMAR QUAL EMBARCACAO
				m_atual[i,j]:= -1;
				
				//Atribuindo na matriz original do jogador atual
				If  ( cont = 1) then
				begin
					m1[i, j]:= -1;
				end
				else
				begin
					m2[i, j]:= -1;
				end;				
				
				readkey;
				acertou:= true;
				
				//Continua jogando 
				while (acertou = true) and (parar <> true)do
				begin
				
					//Cabeçalho
					clrscr;
					textcolor (15);
					writeln ('--------------------------------------------------------------------------------');
					writeln(' ');
					gotoxy(31,2);
					textcolor (15);
					writeln('JOGADAS');
					writeln ('--------------------------------------------------------------------------------');
				
				
					//Imprime nome do jogador
					gotoxy(32,4);
					writeln ('Jogador - ', jog_atual);
					writeln (' ');
					writeln (' ');
				
				
					writeln ('Digite a linha para atacar: ');
					readln (i);
					writeln ('Digite a coluna para atacar: ');
					readln (j);
					writeln ('----------------------------------------------------------');
					
				
					//Se a posicao na matriz for 0, e pq tem agua
					if (m_atual[i,j] = 0) then
					begin
						writeln ('Agua, nenhuma embarcacao no local');
						acertou:= false;
						m_atual[i,j]:=-1;
						
						//Atribuindo na matriz original do jogador atual
						If  ( cont = 1) then
						begin
							m1[i, j]:= -1;
						end
						else
						begin
							m2[i, j]:= -1;
						end;						
						
						readkey;
					end
					else					
					if (m_atual[i,j] = -1) then
					begin
						writeln ('Essa posicao ja foi acertada em outra jogada');
						acertou:= false;
						readkey;
					end
					else					
					 if (m_atual[i,j] = 1) then
					begin
						embar:= embarcacoes(i, j, m_atual);
						writeln ('Voce acertou um ', embar);//INFORMAR QUAL EMBARCACAO
						acertou:= true;
						m_atual[i, j]:= -1;
						
						//Atribuindo na matriz original do jogador atual
						If  ( cont = 1) then
						begin
							m1[i, j]:= -1;
						end
						else
						begin
							m2[i, j]:= -1;
						end;						
						
						readkey;
					end;
					
				parar := verifica_ganhador(m_atual);
				
				end;{while de continuar jogando}
			end;{If se acertou}
						
			parar:= verifica_ganhador(m_atual);
			
		end;//while de fim de jogo
		
			//Se a matriz foi 0 ou -1, imprime o nome do jogador atual q ganhou

            //Alternancia entre os jogadores
			If (cont = 1) then
			begin
				jog_atual:= jog2;
			end
			else			
			if (cont = 2) then
			begin
				jog_atual:= jog1;
			end; 
			
			clrscr;
			
			if (verifica_ganhador(m_atual) = true) then
			begin
					gotoxy (32,32);
					writeln(' ');
					writeln ('Parabens! ',jog_atual, ' ganhou');
					readkey;
			end;

end;//procedure
	
	

//Declaracao das variaveis do programa principal
var jogador1,jogador2: string;
       i, j: integer;
       m1,m2: matriz;

{-----------------------------------------------------------------------
Programa principal.
------------------------------------------------------------------------}
begin
	clrscr;
	
	//Inicializando as matrizes
	for i:= 1 to 10 do
	begin
		for j:= 1 to 10 do
		begin
			m1[i, j]:= 0;
			m2[i, j]:= 0;
		end;

	end;
	

	//Tela de Bem vindo!
	bem_vindo;
	
	clrscr;
	
	
	//Cadastro dos jogadores
	jogadores (jogador1,jogador2);
	
	clrscr;
	
	
	//Cadastro das embarcacoes do primeiro jogador
	submarino(m1, jogador1);
	writeln(' ');
	porta_avioes (m1,jogador1);
	writeln(' ');
	navio (m1,jogador1);
	writeln(' ');
	bote (m1,jogador1);
	writeln(' ');
	
	
	//Cadastro das embarcacoes do segundo jogador
	submarino(m2, jogador2);
	writeln(' ');
	porta_avioes (m2,jogador2);
	writeln(' ');
	navio (m2,jogador2);
	writeln(' ');
	bote (m2,jogador2);
	writeln(' ');

	
	//Jogadas do jogadores - com alternancia entre eles
	jogadas (m1, m2, jogador1,jogador2);


	readkey;


end.
