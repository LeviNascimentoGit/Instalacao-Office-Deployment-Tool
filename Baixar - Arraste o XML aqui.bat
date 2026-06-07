	@echo off
	chcp 65001 >nul
start /min "Download" setup.exe /download %1

	setlocal

REM 	Checa se ainda está baixando
REM 	/fi aplica um filtro para os resultados
REM 	IMAGENAME é uma variável do windows para se referir a arquivo executável (*.exe)
REM 	2>nul: Esconde mensagens de erro na tela (caso o comando falhe por algum motivo)
REM 	| find /i "setup.exe" Faz uma busca EXATA no resultado por setup.exe

:inicio
	tasklist /fi "IMAGENAME eq setup.exe" 2>nul | find /i "setup.exe" >nul
	if errorlevel 1 (color a & cls &echo.
echo 	CONCLUÍDO!
echo 	Salvo na pasta %1
	timeout 1 >nul & exit )

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



