@echo off
echo ================================================
pause
echo        SETUP DO PROJETO LOJA - WINDOWS
echo ================================================
echo.

echo [1/6] Verificando versoes do Python e Node.js...
python --version
node --version
npm --version
echo.

echo [2/6] Criando ambiente virtual Python para o backend...
cd ../backend_django
python -m venv .venv
echo.

echo [3/6] Ativando ambiente virtual e instalando dependencias Python...
call .venv\Scripts\activate
pip install --upgrade pip
pip install -r requirements.txt
echo.

echo [4/6] Realizando migracoes do Django...
python manage.py migrate
echo.

echo [5/6] Instalando dependencias do frontend Vue.js...
cd ..\frontend_vue
npm install
echo.

echo [6/6] Setup concluido!
echo.
echo ================================================
echo              COMANDOS UTEIS
echo ================================================
echo Para rodar o backend:
echo   cd backend_django
echo   .venv\Scripts\activate
echo   python manage.py runserver
echo.
echo Para rodar o frontend:
echo   cd frontend_vue  
echo   npm run dev
echo ================================================
pause