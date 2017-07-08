{  -----UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL-REI-----
		         Isabella Vieira Ferreira
		          Mônica Neli de Resende
	        Ciência da Computação - 1º período
			            01/07/2011                          }

Program jogo_da_velha;

uses crt;

var i, j , l , cont, jogs, opcao1: integer;
	matriz : array[1..3,1..3] of string;
	jog1,jog2,jog_atual: string;
	opcao: string;
	flag,usado: boolean;


{-----------------------------------------------------------------------
Procedimento da tela inicial.
------------------------------------------------------------------------}
procedure bem_vindo;
begin
    clrscr;
	

	writeln ('--------------------------------------------------------------------------------');
	writeln(' ');
	gotoxy(35,4);
	writeln('Bem Vindo!');
	writeln(' ');
	writeln ('--------------------------------------------------------------------------------');
	writeln('');
	writeln('');

	
	gotoxy(20,6);
	writeln('Jogo da Velha - Instrucoes de como jogar');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	
	gotoxy (0,9);
	writeln(' -> O primeiro jogador ficara com o "X" automaticamente. ');
	writeln(' ');
	writeln(' -> O segundo jogador ficara com o "O" automaticamente.  ');
    writeln(' ');
	writeln(' -> O usuario deve digitar o numero da posicao desejada de acordo com as ');
	writeln('    especificoes na tela.  ');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	writeln(' ');
	
	writeln ('--------------------------------------------------------------------------------');
	write('                Pressione qualquer tecla para continuar...');

	readkey;

end;


{-----------------------------------------------------------------------
Procedimento de cadastro de jogadores.
------------------------------------------------------------------------}
procedure jogadores (var jog1, jog2: string );
begin
        textcolor(10);
		write('Jogador 1 - Digite seu nome: ');
		readln(jog1);
		
		while ( jog1 = '') do
		begin
				write('Digite um nome valido: ');
				readln(jog1);
		end;

		textcolor(9);
		write('Jogador 2 - Digite seu nome: ');
		readln(jog2);
		
		while ( jog2 = '') do
		begin
				write('Digite um nome valido: ');
				readln(jog2);
		end;

end;
{-----------------------------------------------------------------------
Procedimento da tela inicial.
------------------------------------------------------------------------}

procedure telainicial;
begin
	clrscr;
	
	textcolor(15);
	gotoxy(34,2);
	writeln('JOGO DA VELHA');
	writeln ('--------------------------------------------------------------------------------');

	textcolor(15);
 	writeln (' ');
	gotoxy(34,5);
	textcolor(13);
	write(' |     |  ');
	gotoxy(30,6);
	write(' ');
	
	//Definindo as cores para o 'X' e a 'O'
	if (matriz[1,1] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[1,1] = 'O') then 
	begin
		textcolor(9);
	end;
	
	//Imprimindo o conteudo da matriz
	write(' ',matriz[1,1]); 
	textcolor(15);
	textcolor(13);
	write('  |  ');
	
	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[1,2] = 'X') then
	begin 
		textcolor(10);
	end;
	if (matriz[1,2] = 'O') then
	begin 
		textcolor(9);
	end;

	write(matriz[1,2],' '); 
	textcolor(13);
	write(' | ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[1,3] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[1,3] = 'O') then 
	begin
		textcolor(9);
	end;
	
	write(' ',matriz[1,3]); 
	textcolor(15);
	writeln(' ');
	gotoxy(30,7);
	textcolor(13);
	writeln('_____|_____|_____');
	gotoxy(30,8);
	textcolor(13);
	writeln('     |     | ');
	gotoxy(30,9);
	write(' ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[2,1] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[2,1] = 'O') then
	begin
		textcolor(9);
	end;
	
	write(' ',matriz[2,1]); 
	textcolor(13);
	write('  |  ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[2,2] = 'X') then
	begin
		textcolor(10);
	end;
	if (matriz[2,2] = 'O') then 
	begin
		textcolor(9);
	end;
	
	write(matriz[2,2],' '); 
	textcolor(13);;
	write(' | ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[2,3] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[2,3] = 'O') then
	begin 
		textcolor(9);
	end;
	
	write(' ',matriz[2,3]); 
	textcolor(15);
	writeln(' ');
	
	gotoxy(30,10);
	textcolor(13);
	writeln('_____|_____|_____');
	gotoxy(30,11);
	textcolor(13);
	writeln('     |     | ');
	gotoxy(30,12);
	write(' ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[3,1] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[3,1] = 'O') then 
	begin
		textcolor(9);
	end;
	
	write(' ',matriz[3,1]); 
	textcolor(13);
	write('  |  ');

	//Definindo as cores para o 'X' e a 'O'
	if (matriz[3,2] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[3,2] = 'O') then 
	begin
		textcolor(9);
	end;
	
	write(matriz[3,2],' '); 
	textcolor(13);
	write(' | ');

	//Definindo as cores para o 'X' e a 'O'	
	if (matriz[3,3] = 'X') then 
	begin
		textcolor(10);
	end;
	if (matriz[3,3] = 'O') then 
	begin
		textcolor(9);
	end;
	
	write(' ',matriz[3,3]); 
	textcolor(15);
	writeln(' ');
	gotoxy(30,13);
	textcolor(13);
	writeln('     |     | ');
	writeln;
	textcolor(15);
	writeln ('--------------------------------------------------------------------------------');

end;

{------------------------------------------------------------------------------------------------------------------------------------------
Procedimento que atribui  'X' ou 'O' ao numero digitado pelo usuario de acordo com o jogador atual.
-------------------------------------------------------------------------------------------------------------------------------------------}
procedure valor_valido (jog_atual, jog1, jog2: string);
begin

	usado := false;
	
	//repetir enquanto nao digitar um valor valido
	while (opcao <> 'X') and (opcao <> 'O') and (usado <> true) do
	begin

		readln(opcao);
	
		usado:= false;
	
		for l := 1 to 3 do
		begin
			for j := 1 to 3 do
			begin
				if (opcao = matriz[l,j]) then
				begin
					usado:= true;
				end;
			end;
		end;


	//verificando se o valor é valido, se nao entrou nas condicoes acima 
	if (opcao = 'X') or (opcao = 'O') or (usado = false) then
	begin
		write('Digite um valor valido: ');
	end;
end;


	If (jog_atual = jog1) then
	begin
		for l := 1 to 3 do
		begin
			for j := 1 to 3 do
			begin
				if (opcao = matriz[l,j]) then
				begin
					matriz[l,j] := 'X';
				end;
			end;
		end;
	end;


	if (jog_atual = jog2) then
	begin
		for l := 1 to 3 do
		begin
			for j:= 1 to 3 do
			begin
				if (opcao = matriz[l,j]) then
				begin
						matriz[l,j] := 'O';
				end;
			end;
		end;
	end;
end;


{-----------------------------------------------------------------------
Procedimento para verificar se ja ha ganhador.
------------------------------------------------------------------------}
procedure verifica_ganhou;
begin
   //Verificando a primeira linha
	if (matriz[1,1] = matriz[1,2]) and (matriz[1,1] = matriz[1,3]) then
	begin
			flag := true;
	end;
	
	//Verificando a segunda linha 
	If (matriz[2,1] = matriz[2,2]) and (matriz[2,1] = matriz[2,3]) then
	begin
			flag := true;
	end;
	
	//Verificando a terceira linha
	If (matriz[3,1] = matriz[3,2]) and (matriz[3,1] = matriz[3,3]) then
	begin
		flag := true;
	end;
	
	//Verificado a primeira coluna
	If  (matriz[1,1] = matriz[2,1]) and (matriz[1,1] = matriz[3,1]) then
	begin
			flag := true;
	end;
	
	//Verificando a  segunda coluna
	If  (matriz[1,2] = matriz[2,2]) and (matriz[1,2] = matriz[3,2]) then
	begin
			flag := true;	
	end;
	
	//Verificando a terceira coluna
	If (matriz[1,3] = matriz[2,3]) and (matriz[1,3] = matriz[3,3]) then
	begin
			flag := true;
	end;
	
	//Verificando a diagonal principal
	If  (matriz[1,1] = matriz[2,2]) and (matriz[1,1] = matriz[3,3]) then
	begin
			flag := true;
	end;
	
	//Verificando a diagonal secundaria
	If  (matriz[1,3] = matriz[2,2]) and (matriz[1,3] = matriz[3,1]) then
	begin
		flag := true;
     end;
end;


{----------------------------------------------------------------------
Programa principal.
-----------------------------------------------------------------------}
begin

    bem_vindo;
    opcao1:= 1;

	while (opcao1 <> 2) do
	begin	
		
		flag := false;
		
		//insercao dos numeros na matriz
		matriz[1,1] := '1';
		matriz[1,2] := '2';
		matriz[1,3] := '3';
		matriz[2,1] := '4';
		matriz[2,2] := '5';
		matriz[2,3] := '6';
		matriz[3,1] := '7';
		matriz[3,2] := '8';
		matriz[3,3] := '9';


		telainicial;
		
		//Cadastros de jogadores
		jogadores(jog1, jog2);		
		
		telainicial;
		
		cont:= 1;
		jogs:= 0;
		
		//Jogadas
         for i:= 1 to 9 do
         begin
         
            //Alternancia entre os jogadores
			If (cont = 1) then
			begin
				jog_atual:= jog1;
				cont:= cont + 1;
				textcolor(10);
			end
			else			
			if (cont = 2) then
			begin
				jog_atual:= jog2;
				cont:= cont - 1;
				textcolor(9);
			end;   
         
               
				write(jog_atual,' - Digite o numero da posicao desejada:  ');				
				valor_valido(jog_atual, jog1, jog2);
				verifica_ganhou;
				jogs:= jogs + 1;
				telainicial;
				
				//Se houver ganhador sai do for
				If (flag = true) then
				begin
					break;
				end;
				
         end; //for

	if (flag = false) then
	begin
	
	    clrscr;
        writeln(' ');
		writeln ('--------------------------------------------------------------------------------');
		gotoxy(35, 4);
		writeln('Ganhador');
        writeln(' ');        
		writeln ('--------------------------------------------------------------------------------');
		
		writeln (' ');
		writeln (' ');
		writeln (' ');
		writeln (' ');
		writeln (' ');
		writeln (' ');
		gotoxy(33, 10);
		writeln('Ninguem ganhou!');
		writeln (' ');
		writeln (' ');
		writeln (' ');
		writeln (' ');
         
	
	end
	else
	begin
	   //nome do jogador que jogou por ultimo
	   clrscr;
        writeln(' ');
		writeln ('--------------------------------------------------------------------------------');
		gotoxy(36, 4);
		writeln('Ganhador');
        writeln(' ');
    	writeln ('--------------------------------------------------------------------------------');		
		
		textcolor(15);
		gotoxy(36, 10);
		writeln(jog_atual); 
		gotoxy(35,15);
		writeln(' Parabens!');
	end;

	    writeln(' ');
	    writeln(' ');
	    writeln(' ');
	    writeln(' ');
	    writeln(' ');
		writeln ('--------------------------------------------------------------------------------');
		textcolor(15);
		write('               Deseja jogar novamente? [1] - sim / [2] - nao ');
		readln(opcao1);
	
	while (opcao1 <> 1) and (opcao1 <> 2) do
	begin
	gotoxy(32, 50);
	writeln (' ');
	writeln (' ');
	writeln (' ');
	write('               Deseja jogar novamente? [1] - sim / [2] - nao ');
	readln(opcao1);	
	end;
	
	
end;

	readkey;
	
end. 
