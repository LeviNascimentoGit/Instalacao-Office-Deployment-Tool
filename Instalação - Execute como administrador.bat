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

echo 	!contador!. %%i ) 

	echo. 

REM 	Se nenhum arquivo for encontrado, encerra o script

	if %contador% equ 0 ( color e

echo 	Precisa conter um arquivo de configuração .xml nesta pasta 

	timeout 6 >nul & exit )


REM 	Define a variável xml baseado na variável opção

set /p opcao=^>	Escolha um número da lista e pressione [Enter]:
set "xml=!arquivo_%opcao%!"

REM 	Verifica se uma opção foi digitada

	if "%xml%"=="" (
	cls 
	color e
	echo.

echo 	Selecione um número da lista

timeout 2 >nul & goto inicio )	

setup.exe /configure %xml%
