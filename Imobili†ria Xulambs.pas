{  -----UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL-REI-----
		       Isabella Vieira Ferreira
		         Mônica Neli de Resende
	       Ciência da Computação - 1º período
			          01/07/2011                                   }


program imobiliaria_xulambs;

uses crt;


// Registro com os dados dos clientes
type clientes = record
	nome,rua,bairro,cidade,estado,pais,tel,cpf: string[20];
	num_casa: integer;
end;

	
// Registro com os dados do imovel	
type imovel = record
	tipo,rua,bairro,cidade,estado,pais: string[20];
	qtde_quartos,qtde_vagas,cod,num: integer;
	obs: string;
	piscina: char;
end;



// Registro com os dados da locacao
type locacao = record
	cod: integer;
	prazo_loc,cpf_locatario,cpf_prop :string[20];
	valor: real;
end;



// Declaracao dos tipos de arquivo
type arquivo_cliente= file of clientes;
		 arquivo_imovel= file of imovel;
		 arquivo_locacao= file of locacao;

// Tipo de vetor	
type vet= array [1..1000] of integer;
		vet1= array [1..1000] of string;


//Declaracao das variaveis
var	
	opcao,opcao1: integer;
	arquivo1 : arquivo_cliente;
	arquivo2 : arquivo_imovel;
	arquivo3 : arquivo_locacao;
	


{----------------------------------------------------------------------------------
Procedimento responsavel pelo cadastro dos clientes.
-----------------------------------------------------------------------------------}
procedure cadastro_clientes (var arquivo: arquivo_cliente);
var i,n: integer;
	   dados:clientes;
begin
		
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	
	writeln ('   ');	
	write ('Informe quantos dados deseja cadastrar: ');
	readln (n);
	writeln ('   ');
	
	clrscr;
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	//Dados do cliente
	for i:= 1 to n do
	begin
		write ('Nome: ');
		readln (dados.nome);
		write ('CPF:  ');
		readln (dados.cpf);
		write ('Telefone: ');
		readln (dados.tel);
		write ('Rua: ');
		readln(dados.rua);
		write ('Numero: ');
		readln (dados.num_casa);
		write ('Bairro: ');
		readln (dados.bairro);
		write ('Cidade: ');
		readln(dados.cidade);
		write ('Pais: ');
		readln (dados.pais);

		// Gravando no arquivo
		write (arquivo,dados);
		writeln ('---------------------------------------------');
	end;
	
	// Fechando o arquivo
	close (arquivo);
	
end;


{-----------------------------------------------------------------------------
Procedimento responsavel pelo cadastro dos imoveis.
------------------------------------------------------------------------------}
procedure cadastro_imovel (var arquivo: arquivo_imovel);
var i,n: integer;
	  dados:imovel;
begin
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	writeln ('   ');
	write ('Quantos dados deseja cadastrar: ');
	readln (n);
	
	clrscr;
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	//Dados do imovel
	for i:= 1 to n do
	begin
	
		write ('Tipo do imovel: ');
		readln (dados.tipo);
		write ('Quantidade de quartos:  ');
		readln (dados.qtde_quartos);
		write ('Tem piscina? (s/n): ');
		readln (dados.piscina);
		write ('Rua: ');
		readln (dados.rua);
		write ('Numero: ');
		readln (dados.num);
		write ('Bairro: ');
		readln (dados.bairro);
		write ('Cidade: ');
		readln(dados.cidade);
		write ('Pais: ');
		readln (dados.pais);
		write ('Vagas na garagem: ');
		readln (dados.qtde_vagas);
		write ('Codigo do imovel: ');
		readln (dados.cod);
		write ('Observacoes: ');
		readln (dados.obs);

		// Escrevendo no arquivo
		write (arquivo,dados);
		writeln ('---------------------------------------------');
	end;
	
	//Fechando o arquivo
	close (arquivo);
	
end;


{-----------------------------------------------------------------------------
Procedimento responsavel pelo cadastro das locacoes.
------------------------------------------------------------------------------}
procedure cadastro_locacao (var arquivo: arquivo_locacao);
var i,n: integer;
	   dados: locacao;
	 
begin
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	writeln (' ');	
	write ('Quantos dados deseja cadastrar: ');
	readln (n);
	
	clrscr;
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	//Dados da Locacao
	for i:= 1 to n do
	begin
		write ('Codigo do imovel: ');
		readln (dados.cod);
		write ('CPF do locatario:  ');
		readln (dados.cpf_locatario);
		write ('CPF do proprietario:  ');
		readln (dados.cpf_prop);
		write ('Valor do aluguel: R$ ');
		readln (dados.valor);
		write ('Prazo de locacao: ');
		readln (dados.prazo_loc);
		
		//Escrevendo no arquivo
		write (arquivo,dados);
		writeln ('---------------------------------------------');
	end;
	
	//Fechando o arquivo
	close (arquivo);
		
end;

{---------------------------------------------------------------------------------------------------------
Procedimento que imprime na tela as informações dos clientes cadastrados.
---------------------------------------------------------------------------------------------------------}
procedure informacoes_clientes (var arquivo: arquivo_cliente);
var  dados: clientes;
		i: integer;
begin

	//abrindo arquivo ja criado
	reset (arquivo);
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	for i:= 1 to filesize(arquivo) do
	begin
	
		//Lendo as informações do arquivo
		read (arquivo,dados);
		
		//Dados do cliente
		writeln ('Nome: ',dados.nome);
		writeln ('CPF:  ',dados.cpf);
		writeln ('Telefone: ',dados.tel);
		writeln  ('Rua: ',dados.rua);
		writeln  ('Numero: ',dados.num_casa);
		writeln ('Bairro: ',dados.bairro);
		writeln ('Cidade: ',dados.cidade);
		writeln ('Pais: ',dados.pais);
		writeln ('---------------------------------------------');
		writeln (' ');
		
		readkey;
  end;
  
	//Fechando o arquivo
 	close (arquivo);
 	
 end;
 
{---------------------------------------------------------------------------------------------------------
Procedimento que imprime na tela as informações dos imoveis cadastrados.
----------------------------------------------------------------------------------------------------------}
procedure informacoes_imoveis (var arquivo: arquivo_imovel);
var dados: imovel;
		i: integer;
begin

	//abrindo arquivo ja criado
	reset (arquivo);
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	for i:= 1 to filesize(arquivo) do
	begin
	
		//Lendo as informações do arquivo
		read (arquivo,dados);
		
		//Dados do imovel
		writeln ('Tipo do imovel: ',dados.tipo);
		writeln ('Quantidade de quartos:  ',dados.qtde_quartos);
		writeln ('Tem piscina? (s/n): ',dados.piscina);
		writeln ('Rua: ',dados.rua);
		writeln ('Numero: ',dados.num);
		writeln ('Bairro: ',dados.bairro);
		writeln ('Cidade: ',dados.cidade);
		writeln ('Pais: ',dados.pais);
		writeln ('Vagas na garagem: ',dados.qtde_vagas);
		writeln ('Codigo do imovel: ',dados.cod);
		writeln ('Observacoes: ',dados.obs);
		writeln ('---------------------------------------------');
		writeln (' ');
		readkey;
	end;
	
	//Fechando o arquivo
 	close (arquivo);
 	
 end;
 
 
{---------------------------------------------------------------------------------------------------------
Procedimento que imprime na tela as informações das locacoes cadastradas.
-------------------------------------------------------------------------------------------------------------}
procedure informacoes_locacoes (var arquivo: arquivo_locacao);
var dados: locacao;
		i: integer;
begin

	//abrindo arquivo ja criado
	reset (arquivo);
	
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	for i:= 1 to filesize(arquivo) do
	begin
	
		//Lendo as informações do arquivo
		read (arquivo,dados);
		
		//Dados das locacoes
		writeln ('Codigo do imovel: ',dados.cod);
		writeln ('CPF do locatario:  ',dados.cpf_locatario);
		writeln ('CPF do proprietario:  ',dados.cpf_prop);
		writeln ('Valor do aluguel: R$ ',dados.valor:0:2);
		writeln ('Prazo de locacao: ',dados.prazo_loc);
		writeln ('---------------------------------------------');
		writeln (' ');
		
		readkey;
	end;
	
	//Fechando o arquivo
 	close (arquivo);
 	
 end;
 
{------------------------------------------------------------------------------------------------------------------
Procedimento responsavel por calcular o valor a ser arrecadado pela imobiliaria
(10% do valor de cada aluguel).
-------------------------------------------------------------------------------------------------------------------}
procedure arrecadacao (var arquivo: arquivo_locacao);
var dados: locacao;
	   arrecadado: real;
	   total: real;
begin
		
		//abrindo arquivo ja existente
		reset (arquivo);
		
		total:= 0;
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
	
		while (not(EOF(arquivo))) do
		begin
			//lendo o arquivo
			read (arquivo, dados);
			arrecadado:= 0;
			arrecadado:= (dados.valor * 0.10);                                                //arrecadado - recebe 10% de cada aluguel
			total:= total + arrecadado;                                                               //total - soma os 10% de todos os alugueis
		end;
		
		//Imprimindo na tela
		writeln (' ');
		writeln (' -> A imobiliaria arrecadou R$ ',total:0:2,' do valor dos alugueis');
			
end;


{-------------------------------------------------------------------------------------------------------
Procedimento que busca os imoveis alugados pela quantidade de quartos
--------------------------------------------------------------------------------------------------------}
procedure busca_quartos (var arq: arquivo_locacao; var arquivo: arquivo_imovel);
var  dados: locacao;
		registro: imovel;
		vetor: vet;
		i,x,j,k: integer;
		flag: boolean;
begin
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');

		//Abrindo arquivos ja existentes
		reset (arq);                         //arquivo de locacao
		reset (arquivo);                 //arquivo dos imoveis
		
		
		write ('Informe a quantidade de quartos para buscar: ');
		readln (x);
		
		//Atribuindo zero as posicoes do vetor
		for i:= 1 to  1000  do
		begin
				vetor[i]:=0;
		end;
		
		flag:= false;
		i:= 1;
		
		//Armazena no vetor os codigos dos imoveis alugados (para comparar no outro arquivo).
		while (not(EOF(arq))) do
		begin
			//lendo o arquivo de locacoes
			read (arq,dados);
			//atribuindo no vetor os codigos de imoveis que estao alugados
			vetor[i]:= dados.cod;
			 i:= i + 1;
		end;
		

			//Compara os codigos do vetor com os codigos do arquivo 'Imoveis', se for igual, verifica se a quantidade de quartos = a que o usuario quer	
			for k:= 1 to filesize (arquivo) do
			begin
				//lendo arquivo de imoveis
				  read (arquivo,registro);
				  for j:= 1 to i do
				  begin
					//Comparando os codigos do vetor (que estao alugados), com os codigos de todos os imoveis
					if (vetor[j] = registro.cod) then
					begin
						//Compara se a quantidade de quartos é igual a que o usuario deseja, se for, imprime as informações dakele imovel
						if (x = registro.qtde_quartos) then
						begin
							writeln ('Tipo do imovel: ',registro.tipo);
							writeln ('Quantidade de quartos:  ',registro.qtde_quartos);
							writeln ('Tem piscina? (s/n): ',registro.piscina);
							writeln ('Rua: ',registro.rua);
							writeln ('Numero: ',registro.num);
							writeln ('Bairro: ',registro.bairro);
							writeln ('Cidade: ',registro.cidade);
							writeln ('Pais: ',registro.pais);
							writeln ('Vagas na garagem: ',registro.qtde_vagas);
							writeln ('Codigo do imovel: ',registro.cod);
							writeln ('Observacoes: ',registro.obs);
							writeln ('---------------------------------------------');
							writeln (' ');
							
							flag:= true;
							readkey;
					end;//if
				end;//if
			  end;//for j
		end;// for i
		
		//Se nao houver imoveis alugados com a quantidade de quartos que o usuario deseja
		if (flag = false) then
		begin
				writeln ('Nao ha imoveis alugados com essa quantidade de quartos');
		end; 
	
	//Fechando os arquivos
	close (arq);
	close(arquivo);

end;

{------------------------------------------------------------------------------------------
Procedimento que mostra os imoveis que nao estao alugados
------------------------------------------------------------------------------------------}
procedure imoveis_naoalugados (var arquivo: arquivo_imovel ; var arq: arquivo_locacao);
var	dados:  imovel;        
		registro: locacao;
		vetor: vet;
		i,j,k: integer;
		flag: boolean;
begin

		//Abrindo arquivos ja existentes
		reset (arquivo);      //arquivo dos imoveis
		reset (arq);             //arquivo de locacao

		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		gotoxy (27,5);
		writeln ('Imoveis que nao estao alugados');
		writeln (' ');
		writeln (' ');
		
		
		flag:= false;
		i:= 1;
		
		//Armazena no vetor os codigos dos imoveis que estao alugados (para comparar no arquivo de todos os imoveis )
		while (not(EOF(arq))) do
		begin
			read (arq,registro);                                           //Arquivo de locacoes
			vetor[i]:= registro.cod;                                        //Atribuindo no vetor os codigos de todos os imoveis alugados
			i:= i + 1;
		end;

		//Compara os codigos do vetor com os codigos do arquivo 'Imoveis'
		//Se for igual significa que aquele imovel esta alugado
			for k:= 1 to filesize (arquivo) do
			begin
					//Lendo o arquivo Imovel
				  read (arquivo,dados);
				  flag:= false;
				 for j:= 1 to i do
				 begin
					//Comparando os codigos de todos os imoveis com os codigos dos imoveis alugados
					//Se for igual e pq o imovel esta alugado
					if (vetor[j] = dados.cod) then
					begin
						flag:= true;
					end;
				end;//for j
				//Se a flag for falsa e porque o imovel nao esta alugado.
				if (flag = false) then
				begin
							writeln ('Tipo do imovel: ',dados.tipo);
							writeln ('Quantidade de quartos:  ',dados.qtde_quartos);
							writeln ('Tem piscina? (s/n): ',dados.piscina);
							writeln ('Rua: ',dados.rua);
							writeln ('Numero: ',dados.num);
							writeln ('Bairro: ',dados.bairro);
							writeln ('Cidade: ',dados.cidade);
							writeln ('Pais: ',dados.pais);
							writeln ('Vagas na garagem: ',dados.qtde_vagas);
							writeln ('Codigo do imovel: ',dados.cod);
							writeln ('Observacoes: ',dados.obs);
							writeln ('---------------------------------------------');
							writeln (' ');
						
						    readkey;
				end;//if
			end; // for i
			
			if (flag = true) then
			begin
				writeln ('Todos os imoveis estao alugados');
			end;
			
	//Fechando os arquivos
	close(arquivo);
	close (arq);

end;

{-------------------------------------------------------------------------------------------------------
Procedimento que busca nome e telefone do locatario pelo valor  do aluguel.
---------------------------------------------------------------------------------------------------------}
procedure  busca_valoraluguel (var arquivo: arquivo_cliente; var arq: arquivo_locacao);
var dados: clientes;
	   registro: locacao;
	   x: real;
	   i,j: integer;
	   naoentrou: boolean;
begin

		//Abrindo os arquivos ja existentes
		reset (arquivo);                         //arquivo do cliente
		reset (arq);                                //arquivo de locacao
		
		i:= 1;
		naoentrou:=false;
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		write ('Digite o valor do aluguel para buscar: ');
		readln (x);
		writeln (' ');
		writeln (' ');
		
		clrscr;
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		gotoxy (27,5);
		writeln ('Informacoes do locatario');
		writeln (' ');
		writeln (' ');
		
		//Se o CPF do arquivo de clientes for igual ao CPF do locatario (arquivo de locacao) imprime o nome e telefone do locatario
		for i:= 1 to filesize(arq) do
		begin
				read (arq, registro);
				//Comparando se o valor de aluguel digitado e igual ao valor de alguel do cpf em comum
				if (x = registro.valor) then
				begin
						for j:= 1 to filesize (arquivo) do
						begin
							read (arquivo,dados);
							if (registro.cpf_locatario = dados.cpf) then
							begin
									writeln ('Nome: ',dados.nome);
									writeln ('Telefone: ',dados.tel);
									writeln (' ');
									writeln ('---------------------------------------------');
									writeln (' ');
									naoentrou:= true;
									break;
							end;
						end;
				 end;
		end;

		//Se nao encontrar imoveis com o valor de aluguel
		if (naoentrou = false) then
		begin
			writeln ('Nao ha imoveis alugados com esse valor de aluguel');
		end;
		
		close (arquivo);
		close (arq);
end;

{-----------------------------------------------------------------------------------
Consulta 1. Mostra se o cliente e locatario ou proprietario.
Se ele for proprietario mostra o valor que ele recebera
(sem os 10% da imobiliaria),se for locatario,mostra quanto
paga de aluguel.
------------------------------------------------------------------------------------}		
procedure consulta1 (var arquivo: arquivo_cliente; var arq: arquivo_locacao);
var  dados: clientes;
        registros: locacao;
        i, j: integer;
begin

	clrscr;
		
	//Cabeçalho
	writeln ('--------------------------------------------------------------------------------');
	gotoxy (27,2);
	writeln ('    IMOBILIARIA XULAMBS   ');
	writeln ('--------------------------------------------------------------------------------');
	
	//Arquivo de locacoes
	reset(arq);
	//Arquivo de Clientes
	reset(arquivo);
	
	writeln(' ');
	
	//Correndo o arquivo clientes e para cada cliente mostra se ele e locatario ou proprietario
	for i:= 1 to (filesize(arquivo)) do
	begin
			read(arquivo, dados);
			
			//Correndo o arquivo de locacoes 
			for j:= 1 to (filesize(arq)) do
			begin
				read(arq, registros);
				
				If (dados.cpf = registros.cpf_locatario) then
				begin
					writeln('Nome: ', dados.nome);
					writeln('Telefone: ', dados.tel);
					writeln(' ');
					writeln('Cilente locatario - Valor do aluguel : R$ ', registros.valor:0:2);
					writeln(' ');
		            writeln ('--------------------------------------------------------------------------------');
					writeln(' ');
					readkey;
					break;
				end
				else 
				begin
					writeln('Nome: ', dados.nome);
					writeln('Telefone: ', dados.tel);
					writeln(' ');
					//Valor arrecadado do imovel em questao
					writeln('Cilente proprietario - Valor arrecadado: R$ ', (registros.valor - (registros.valor * 0.10)):0:2);
					writeln(' ');
		            writeln ('--------------------------------------------------------------------------------');
		            writeln(' ');
		            readkey;
		            break;
				end ;		
			end;
	end;
end;

{------------------------------------------------------------------------------------
Segunda consulta. Busca pelo numero de vagas na garagem e 
mostra se ela esta alugada ou nao.
-------------------------------------------------------------------------------------}
procedure consulta2 (var arquivo: arquivo_imovel; var arq: arquivo_locacao);
var x,i,j: integer;
	  dados: imovel;
	  registro: locacao;
	  flag: boolean;

begin
		
		//Abrindo arquivos ja existentes
		reset (arquivo);     //Arquivo dos imoveis
		reset (arq);            //Arquivo das locacoes
		
		flag:= false;

		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		
		//Usuario digita a quantidade de vagas na garagem
		write ('Digite o numero de vagas na garagem para buscar o imovel : ');
		readln (x);
		writeln (' ');
		writeln (' ');
		
		clrscr;
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		for i:= 1 to filesize(arquivo) do
		begin
			read (arquivo,dados);      //lendo arquivo de imoveis 
			if (x = dados.qtde_vagas) then
			begin
				for j:= 1 to filesize (arq) do
				begin
					read (arq, registro);       //lendo  arquivo de locacao
					if (dados.cod = registro.cod) then   //Se os codigos forem iguais e pq o imovel esta alugado, entao imprime as informaçoes da locacao
					begin
						writeln (' -> Imovel alugado');
						writeln (' ');
						writeln ('Codigo do imovel: ',registro.cod);
						writeln ('CPF do locatario:  ',registro.cpf_locatario);
						writeln ('CPF do proprietario:  ',registro.cpf_prop);
						writeln ('Valor do aluguel: R$ ',registro.valor:0:2);
						writeln ('Prazo de locacao: ',registro.prazo_loc);
						writeln ('---------------------------------------------');
						writeln (' ');
						flag:= true;
						readkey;
						break;
					end
					else
					begin //Se os codigos forem diferentes e pq o imovel nao esta alugado, entao imprime as informacoes do imovel
						writeln (' -> Imovel nao alugado');
						writeln (' ');
						writeln ('Tipo do imovel: ',dados.tipo);
						writeln ('Quantidade de quartos:  ',dados.qtde_quartos);
						writeln ('Tem piscina? (s/n): ',dados.piscina);
						writeln ('Rua: ',dados.rua);
						writeln ('Numero: ',dados.num);
						writeln ('Bairro: ',dados.bairro);
						writeln ('Cidade: ',dados.cidade);
						writeln ('Pais: ',dados.pais);
						writeln ('Vagas na garagem: ',dados.qtde_vagas);
						writeln ('Codigo do imovel: ',dados.cod);
						writeln ('Observacoes: ',dados.obs);
						writeln ('---------------------------------------------');
						writeln (' ');
						flag:= true;
						readkey;
						break;
				end;
			end;//for j
		end;//if
	end;//for i
	
	if (flag = false) then
	begin
		writeln ('Nao ha imoveis com essa quantidade de garagens');
	end;
							
		//Fechando os arquivos
		close (arquivo);
		close (arq);		
		
end;

{------------------------------------------------------------------------------------------------------------------------
Terceira consulta. Busca pelo bairro e mostrar qual esta alugado e nao esta alugado
------------------------------------------------------------------------------------------------------------------------}
procedure consulta3 (var arquivo: arquivo_imovel; var arq: arquivo_locacao);
var i,j: integer;
	  dados: imovel;
	  registro: locacao;
	  x: string[20];
	  flag: boolean;

begin
		
		//Abrindo arquivos ja existentes
		reset (arquivo);     //Arquivo dos imoveis
		reset (arq);            //Arquivo das locacoes
		
		flag:= false;

		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		
		//Usuario digita o bairro
		write ('Digite o bairro para buscar o imovel : ');
		readln (x);
		writeln (' ');
		writeln (' ');
		
		clrscr;
		
		//Cabeçalho
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		writeln ('    IMOBILIARIA XULAMBS   ');
		writeln ('--------------------------------------------------------------------------------');
		
		for i:= 1 to filesize(arquivo) do
		begin
			read (arquivo,dados);      //lendo arquivo de imoveis 
			if (x = dados.bairro) then
			begin
				for j:= 1 to filesize (arq) do
				begin
					read (arq, registro);       //lendo  arquivo de locacao
					if (dados.cod = registro.cod) then   //Se os codigos forem iguais e pq o imovel esta alugado, entao imprime as informaçoes da locacao
					begin
						writeln (' -> Imovel alugado');
						writeln (' ');
						writeln ('Codigo do imovel: ',registro.cod);
						writeln ('CPF do locatario:  ',registro.cpf_locatario);
						writeln ('CPF do proprietario:  ',registro.cpf_prop);
						writeln ('Valor do aluguel: R$ ',registro.valor:0:2);
						writeln ('Prazo de locacao: ',registro.prazo_loc);
						writeln ('---------------------------------------------');
						writeln (' ');
						flag:= true;
						readkey;
						break;
					end
					else
					begin //Se os codigos forem diferentes e pq o imovel nao esta alugado, entao imprime as informacoes do imovel
						writeln (' -> Imovel nao alugado');
						writeln (' ');
						writeln ('Tipo do imovel: ',dados.tipo);
						writeln ('Quantidade de quartos:  ',dados.qtde_quartos);
						writeln ('Tem piscina? (s/n): ',dados.piscina);
						writeln ('Rua: ',dados.rua);
						writeln ('Numero: ',dados.num);
						writeln ('Bairro: ',dados.bairro);
						writeln ('Cidade: ',dados.cidade);
						writeln ('Pais: ',dados.pais);
						writeln ('Vagas na garagem: ',dados.qtde_vagas);
						writeln ('Codigo do imovel: ',dados.cod);
						writeln ('Observacoes: ',dados.obs);
						writeln ('---------------------------------------------');
						writeln (' ');
						flag:= true;
						readkey;
						break;
				end;
			end;//for j
		end;//if
	end;//for i
	
	if (flag = false) then
	begin
		writeln ('Nao ha imoveis cadastrados com esse bairro');
	end;
							
		//Fechando os arquivos
		close (arquivo);
		close (arq);		
		
end;


{-----------------------------------------------------------------------
Programa principal.
-----------------------------------------------------------------------}
begin

opcao:= 1;

	//Assinalamento do nome interno e externo do arquivo
	assign (arquivo1, 'Cadastro_clientes.bin');
	assign (arquivo2, 'Cadastro_imovel.bin');
	assign (arquivo3, 'Cadastro_locacao.bin');

	//Menu de opcoes
	while (opcao <> 0 ) do
	begin
		clrscr;
		textcolor(15);
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (27,2);
		textcolor(15);
		writeln ('    IMOBILIARIA XULAMBS   ');
		textcolor(15);
		writeln ('--------------------------------------------------------------------------------');
		gotoxy (20,4);
		textcolor(15);
		writeln ('               :: MENU ::           ');
		writeln ('  ');
		writeln ('  ');
		textcolor(15);
		writeln (' [1]- Cadastrar clientes');
		textcolor(15);
		writeln (' [2]- Cadastrar imoveis');
		textcolor(15);
		writeln (' [3]- Cadastrar locacoes');
		textcolor(15);
		writeln (' [4]- Ver todos os clientes cadastrados');
		textcolor(15);
		writeln (' [5]- Ver todos os imoveis cadastrados');
		textcolor(15);
		writeln (' [6]- Ver todas as locacoes cadastradas');
		textcolor(15);
		writeln (' [7]- Inserir novos clientes');
		textcolor(15);
		writeln (' [8]- Inserir novos imoveis');
		textcolor(15);
		writeln (' [9]- Inserir novas locacoes');
		textcolor(15);
		writeln (' [10]- Consultar valor a ser arrecadado pela imobiliaria ');
		textcolor(15);
		writeln (' [11]- Buscar imoveis pela quantidade de quartos ');
		textcolor(15);
		writeln (' [12]- Buscar informacoes dos imoveis que nao estao alugados ');
		textcolor(15);
		writeln (' [13]- Buscar informacoes dos clientes pelo valor do aluguel');
		textcolor(15);
		writeln (' [14]- Consulta extra');
		textcolor(15);
		writeln (' [0]-  Sair');
		textcolor(15);
		writeln ('--------------------------------------------------------------------------------');
		textcolor(15);
		write ('Digite sua opcao: ');
		readln (opcao);
	
		case opcao of
		
		// Cadastrar clientes
		1: begin
				rewrite(arquivo1);
				clrscr;
				cadastro_clientes(arquivo1);
				readkey;
				clrscr;
			end;
			
		//Cadastrar imoveis	
		2: begin
				rewrite(arquivo2);
				clrscr;
				cadastro_imovel(arquivo2);
				readkey;
				clrscr;
			end;
		
		//Cadastrar locacao	
		3: begin
				rewrite(arquivo3);
				clrscr;
				cadastro_locacao(arquivo3);
				readkey;
				clrscr;
			end;
		
		//Ver todas as informacoes dos clientes cadastrados	
		4: begin
				clrscr;
				informacoes_clientes(arquivo1);
				readkey;
				clrscr;
		end;
		
		//Ver todas as informacoes dos imoveis cadastrados
		5: begin
				clrscr;
				informacoes_imoveis(arquivo2);
				readkey;
				clrscr;
		end;
		
		//Ver todas as informacoes das locacoes cadastradas
		6: begin
			clrscr;
			informacoes_locacoes(arquivo3);
			readkey;
			clrscr;
		end;
		
		//Inserir novos clientes
		7: begin
				clrscr;
				reset (arquivo1);
				seek (arquivo1,filesize(arquivo1));
				cadastro_clientes(arquivo1);
				readkey;
				clrscr;
		end;
		
		//Inserir novos imoveis
		8: begin
				clrscr;
				reset (arquivo2);
				seek (arquivo2,filesize(arquivo2));
				cadastro_imovel (arquivo2);
				readkey;
				clrscr;
		end;
		
		//Inserir novas locações
		9: begin
				clrscr;
				reset (arquivo3);
				seek (arquivo3,filesize(arquivo3));
				cadastro_locacao (arquivo3);
				readkey;
				clrscr;
		end;
		
		//Valor arrecadado pela imobiliaria
		10: begin
				clrscr;
				arrecadacao(arquivo3);
				readkey;
				clrscr;
		end;
		
		// Buscar imóveis pela quantidade de quartos
		11: begin
				clrscr;
				busca_quartos(arquivo3,arquivo2);
				readkey;
				clrscr;
		end;
		
		//Buscar informacoes dos imoveis que nao estao alugados
		12: begin
				clrscr;
				imoveis_naoalugados(arquivo2, arquivo3);
				readkey;
				clrscr;
		end;
		
		//Buscar informações dos clientes pelo valor do aluguel
		13: begin
				clrscr;
				busca_valoraluguel(arquivo1, arquivo3);
				readkey;
				clrscr;
		end;
		
		//Consultas extras
		14: begin
				clrscr;
				
				writeln ('--------------------------------------------------------------------------------');
				gotoxy (27,2);
				writeln ('    IMOBILIARIA XULAMBS   ');
				writeln ('--------------------------------------------------------------------------------');
			
				gotoxy(20,4);
				writeln (' Como brinde, voce ganhou 3 consultas extras');
				writeln (' ');
				gotoxy(8,6);
				writeln ('Para acessar as consultas, digite a opcao de acordo com o menu abaixo');
				
				gotoxy (35,9);
				writeln (' :: Menu:: ');
				writeln (' ');
				writeln (' ');
				writeln (' [1]- Verificar se o cliente e locatario / proprietario e qual o valor que ele'); 
				writeln ('      pagara ou recebera de aluguel');
				writeln (' ');
				writeln (' [2]- Busca pelo numero de vagas na garagem e verificar se o imovel esta alugado      ou nao ');
				writeln (' ');
				writeln (' [3]- Busca pelo bairro e verificar qual imovel nao esta alugado e qual imovel'); 
				writeln ('      esta alugado');
				writeln (' ');
				writeln (' [0]- Voltar ao menu inicial');
				writeln (' ');
				writeln ('--------------------------------------------------------------------------------');
				write ('Opcao: ');
				readln (opcao1);
				
				case opcao1 of
				
				
				//Verificar se o cliente e locatario / proprietario e qual o valor que ele pagara ou recebera de aluguel'
				1: begin
					clrscr;
					consulta1(arquivo1, arquivo3);
					readkey;
					clrscr;
				end;
				
				//Busca pelo numero de vagas na garagem e verificar se o imovel esta alugado ou nao
				2: begin
					clrscr;
					consulta2(arquivo2, arquivo3);
					readkey;
					clrscr;
				end;
				
				//Busca pelo bairro e verificar qual imovel nao esta alugado
				3: begin
					clrscr;
					consulta3 (arquivo2, arquivo3);
					readkey;
					clrscr;
				end;
				
			//Voltar	
			0: begin
				clrscr;
			end;
				
		end;//case
	end;//begin opcao case
		

		//Sair
		0: begin
		
			clrscr;
		
			writeln ('--------------------------------------------------------------------------------');
			gotoxy (27,2);
			writeln ('    IMOBILIARIA XULAMBS   ');
			writeln ('--------------------------------------------------------------------------------');
			
			gotoxy  (27,8);
			writeln ('Digite enter para sair...');
			readkey;
		
		end;
		
	end; // case
	end; //while
			
end.
