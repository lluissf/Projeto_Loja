<script setup>
import { routes } from '@/router/rotas.js';
</script>

<template>
    <header class="bg-white shadow-md">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <RouterLink to="/" class="text-2xl font-bold text-gray-600 hover:text-gray-800 mx-2">BSI Shop</RouterLink>
            <nav class="space-x-4">
                <RouterLink 
                    v-for="route in routes" 
                    :key="route.path"
                    :to="route.path" 
                    class="text-gray-600 hover:text-blue-600 transition-colors duration-200 font-medium"
                    active-class="text-blue-600 font-semibold"
                >
                    {{ route.name }}
                </RouterLink>
            </nav>
        </div>
    </header>
</template>

<style scoped>
/* Estilos adicionais se necessário */
</style>