#!/bin/bash

echo "================================================"
echo "        SETUP DO PROJETO LOJA - LINUX"
echo "================================================"
echo

echo "[1/6] Verificando versões do Python e Node.js..."
python3 --version
node --version
npm --version
echo

echo "[2/6] Criando ambiente virtual Python para o backend..."
cd ../backend_django
python3 -m venv .venv
echo

echo "[3/6] Ativando ambiente virtual e instalando dependências Python..."
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
echo

echo "[4/6] Realizando migrações do Django..."
python manage.py migrate
echo

echo "[5/6] Instalando dependências do frontend Vue.js..."
cd ../frontend_vue
npm install
echo

echo "[6/6] Setup concluído!"
echo

echo "================================================"
echo "              COMANDOS ÚTEIS"
echo "================================================"
echo "Para rodar o backend:"
echo "  cd backend_django"
echo "  source .venv/bin/activate"
echo "  python manage.py runserver"
echo
echo "Para rodar o frontend:"
echo "  cd frontend_vue"
echo "  npm run dev"
echo "================================================"