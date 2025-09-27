#!/bin/bash

echo "================================================"
echo "       INICIANDO PROJETO LOJA - LINUX"
echo "================================================"
echo

# Verificar se o ambiente foi configurado
if [ ! -d "../backend_django/.venv" ]; then
    echo "ERRO: Ambiente virtual não encontrado!"
    echo "Execute primeiro: ./setup.sh"
    exit 1
fi

if [ ! -d "../frontend_vue/node_modules" ]; then
    echo "ERRO: Node modules não encontrados!"
    echo "Execute primeiro: ./setup.sh"
    exit 1
fi

echo "[1/3] Iniciando o backend Django em segundo plano..."
cd backend_django
source .venv/bin/activate
nohup python manage.py runserver > ../backend.log 2>&1 &
BACKEND_PID=$!
cd ..
echo "Backend Django iniciado (PID: $BACKEND_PID)"

echo "[2/3] Aguardando 3 segundos..."
sleep 3

echo "[3/3] Iniciando o frontend Vue.js..."
cd frontend_vue
echo "Frontend Vue.js será iniciado em http://localhost:5173"
echo "Backend Django está rodando em http://localhost:8000"
echo
echo "================================================"
echo "            SERVIÇOS INICIADOS!"
echo "================================================"
echo "Backend:  http://localhost:8000"
echo "Frontend: http://localhost:5173"
echo
echo "Para parar os serviços:"
echo "- Frontend: Pressione Ctrl+C"
echo "- Backend: Execute: kill $BACKEND_PID"
echo "================================================"
echo

# Função para cleanup quando o script for interrompido
cleanup() {
    echo
    echo "Parando serviços..."
    kill $BACKEND_PID 2>/dev/null
    echo "Backend parado."
    exit 0
}

# Registrar função de cleanup para SIGINT (Ctrl+C)
trap cleanup SIGINT

# Executar o frontend (modo interativo)
npm run dev

# Se chegou aqui, o frontend foi fechado, então parar o backend também
cleanup