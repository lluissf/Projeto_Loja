@echo off
echo ================================================
echo       INICIANDO PROJETO LOJA - WINDOWS
echo ================================================
echo.

echo Verificando se o ambiente foi configurado...
if not exist "../backend_django\.venv" (
    echo ERRO: Ambiente virtual nao encontrado!
    echo Execute primeiro: setup.bat
    pause
    exit /b 1
)

if not exist "../frontend_vue\node_modules" (
    echo ERRO: Node modules nao encontrados!
    echo Execute primeiro: setup.bat
    pause
    exit /b 1
)

echo [1/2] Iniciando o backend Django...
start "Backend Django" cmd /k "cd /d %~dp0..\\backend_django && .venv\\Scripts\\activate && echo Backend Django iniciado em http://localhost:8000 && python manage.py runserver"

echo [2/2] Aguardando 3 segundos e iniciando o frontend Vue.js...
timeout /t 3 /nobreak >nul
start "Frontend Vue.js" cmd /k "cd /d %~dp0..\\frontend_vue && echo Frontend Vue.js iniciado em http://localhost:5173 && npm run dev"

echo.
echo ================================================
echo            SERVIÇOS INICIADOS!
echo ================================================
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:5173
echo.
echo Para parar os servicos, feche as janelas dos terminais
echo ou pressione Ctrl+C em cada terminal.
echo ================================================
echo.
echo Pressione qualquer tecla para abrir o navegador...
pause >nul

echo Abrindo navegador...
start http://localhost:5173