<script setup>
import { RouterView } from 'vue-router' 
import Navbar from './components/Navbar.vue';
import Footer from './components/Footer.vue';
</script>

<template>
  <div id="app" class="min-h-screen bg-gray-50 font-sans antialiased">
    <Navbar />
    <main class="flex-1">
      <RouterView />
    </main>
    <!-- Footer -->
    <Footer />
  </div>
</template>

<style>
/* Importar fonte do Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

/* Configurações globais */
* {
  box-sizing: border-box;
}

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  line-height: 1.6;
  color: #1f2937;
}

/* Smooth scrolling */
html {
  scroll-behavior: smooth;
}

/* Utilitários Tailwind personalizados */
.font-sans {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* Melhorar legibilidade do texto */
.antialiased {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Animações suaves para links */
a {
  transition: all 0.2s ease-in-out;
}

/* Estilo para focus accessibilidade */
*:focus {
  outline: 2px solid #3b82f6;
  outline-offset: 2px;
}

/* Loading spinner personalizado */
@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.animate-spin {
  animation: spin 1s linear infinite;
}
</style>
