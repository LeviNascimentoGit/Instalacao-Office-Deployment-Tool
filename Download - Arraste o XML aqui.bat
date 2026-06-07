	@echo off
	chcp 65001 >nul

	set "novo_nome=%~n1"
	start /min "Download" setup.exe /download %1

REM 	Checa se ainda está baixando
REM 	/fi aplica um filtro para os resultados
REM 	IMAGENAME é uma variável do windows para se referir a arquivo executável (*.exe)
REM 	2>nul: Esconde mensagens de erro na tela (caso o comando falhe por algum motivo)
REM 	| find /i "setup.exe" Faz uma busca EXATA no resultado por setup.exe

:inicio
	setlocal
	tasklist /fi "IMAGENAME eq setup.exe" 2>nul | find /i "setup.exe" >nul
	if errorlevel 1 (ren "%~dp0Office" "%novo_nome%" & color a & cls & echo.
echo 	CONCLUÍDO!
echo 	Salvo na pasta %novo_nome%
	timeout 1 >nul & exit)

:animacao
	cls & echo.

echo 	%1
echo.
<nul set /p "= Baixando "
timeout 1 >nul

<nul set /p "=. "
timeout /t 1 >nul

:: Frame 2: Adiciona o segundo ponto
<nul set /p "=. "
timeout /t 1 >nul

:: Frame 3: Adiciona o terceiro ponto
<nul set /p "=. "
timeout 1 >nul

goto inicio



