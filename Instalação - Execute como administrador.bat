	@echo off
	chcp 65001 >nul
REM 	Oculta as entradas de comando e Ativa os acentos no terminal


REM 	Verifica se o usuário está executando o arquivo como administrador

	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	if not %errorlevel%==0 	( color c & echo. & echo.

echo 		[Atenção!]	Este script precisa ser executado como Administrador
	echo.

echo 	Clique neste arquivo com o botão direito do mouse e selecione a opção [Executar como administrador] 

	timeout 8 >nul
	exit
				)

REM	Volta para o diretório atual
	pushd "%~dp0"

:inicio
	cls & color 7 & echo.

REM 	Sem usar: setlocal enabledelayedexpansion 
REM 	O valor da variável até muda internamente na memória, mas o comando echo vai mostrar 0 em todas as repetições, porque o Windows já substituiu o %contador% por 0 antes do laço começar a rodar de verdade. Para avisar o Windows quais variáveis devem esperar, nós trocamos as "%" por "!" 
REM 	Sem essa linha, o Windows tentaria criar uma variável chamada literalmente arquivo_0 para todos os arquivos da lista, e o menu não funcionaria.

	setlocal enabledelayedexpansion

REM 	Lista os arquivos e cria a numeração dinamicamente

	set contador=0 
	for /f "delims=" %%i in ('dir /b *.xml') do (
	set /a contador+=1
	set "arquivo_!contador!=%%i"

	set "nome_sem_extensao_!contador!=%%~ni"

echo 	!contador!. %%i ) 

	echo. 

REM 	Se nenhum arquivo for encontrado, encerra o script

	if %contador% equ 0 ( color e

echo 	Precisa conter um arquivo de configuração .xml nesta pasta 

	timeout 6 >nul & exit )


REM 	Define a variável xml baseado na variável opção

	set /p opcao=^>	Escolha um número da lista e pressione [Enter]:
	set "xml=!arquivo_%opcao%!"
	set "pasta_alvo=!nome_sem_extensao_%opcao%!"

REM 	Verifica se uma opção foi digitada

	if "%xml%"=="" (
	cls 
	color e
	echo.

echo 	Selecione um número da lista

timeout 2 >nul & goto inicio )	
	ren "%pasta_alvo%" "Office"
	start /min "Install" setup.exe /configure %xml%


:checagem
	setlocal
	tasklist /fi "IMAGENAME eq setup.exe" 2>nul | find /i "setup.exe" >nul
	if errorlevel 1 (ren "Office" "%pasta_alvo%" & color a & cls & echo.
echo 	Instalação Concluída !
	timeout 1 >nul & exit)

REM 	Checa se ainda está baixando
REM 	/fi aplica um filtro para os resultados
REM 	IMAGENAME é uma variável do windows para se referir a arquivo executável (*.exe)
REM 	2>nul: Esconde mensagens de erro na tela (caso o comando falhe por algum motivo)
REM 	| find /i "setup.exe" Faz uma busca EXATA no resultado por setup.exe

:animacao
	cls & echo.

echo 	%xml%
echo.
<nul set /p "= 	Instalando "
timeout 1 >nul

<nul set /p "=. "
timeout /t 1 >nul

:: Frame 2: Adiciona o segundo ponto
<nul set /p "=. "
timeout /t 1 >nul

:: Frame 3: Adiciona o terceiro ponto
<nul set /p "=. "
timeout 1 >nul

goto checagem