# Projeto Loja

Este é um projeto fullstack com backend Django e frontend Vue.js para uma aplicação de loja online.

## 🏗️ Estrutura do Projeto

- **backend_django/**: API REST desenvolvida com Django e Django REST Framework
- **frontend_vue/**: Frontend desenvolvido com Vue.js e Vite

## ⚡ Setup Rápido

Para configurar rapidamente o ambiente de desenvolvimento, use um dos scripts de setup disponíveis:

### 🪟 Windows
```bash
setup.bat
```

### 🐧 Linux/Mac
```bash
chmod +x setup.sh
./setup.sh
```

## 🚀 Iniciar Projeto

Após o setup, você pode iniciar ambos os serviços (backend + frontend) automaticamente:

### 🪟 Windows
```bash
start.bat
```

### 🐧 Linux/Mac
```bash
chmod +x start.sh
./start.sh
```

## 📋 Pré-requisitos

Certifique-se de ter instalado:
- **Python 3.8+** (para o backend Django)
- **Node.js 20.19.0+** (para o frontend Vue.js)
- **npm** ou **yarn** (gerenciador de pacotes)

## 🚀 Executando o Projeto

### Backend (Django)
```bash
cd backend_django
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows

python manage.py runserver
```
O backend estará disponível em: `http://localhost:8000`

### Frontend (Vue.js)
```bash
cd frontend_vue
npm run dev
```
O frontend estará disponível em: `http://localhost:5173`

## 🛠️ Scripts Disponíveis

### Backend
- `python manage.py runserver` - Executa o servidor de desenvolvimento
- `python manage.py migrate` - Aplica migrações do banco de dados
- `python manage.py createsuperuser` - Cria um usuário administrador

### Frontend
- `npm run dev` - Executa o servidor de desenvolvimento
- `npm run build` - Gera build de produção
- `npm run preview` - Visualiza o build de produção
- `npm run test:unit` - Executa testes unitários
- `npm run lint` - Executa o linter

## 📚 Tecnologias Utilizadas

### Backend
- Django 5.2.6
- Django REST Framework 3.16.1
- SQLite (banco de dados)

### Frontend  
- Vue.js 3.5.18
- Vue Router 4.5.1
- Vite 7.0.6
- Vitest (testes)

## 📝 Notas

- Os scripts de setup criam automaticamente o ambiente virtual Python e instalam todas as dependências
- Certifique-se de ter as versões corretas do Python e Node.js instaladas antes de executar o setup
- O banco de dados SQLite será criado automaticamente na primeira execução