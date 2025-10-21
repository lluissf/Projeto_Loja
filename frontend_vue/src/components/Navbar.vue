<script setup>
import { ref } from 'vue'
import { routes } from '@/router/rotas.js';

const isMenuOpen = ref(false)

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}
</script>

<template>
    <header class="bg-white/95 backdrop-blur-sm border-b border-gray-100 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <!-- Logo -->
                <RouterLink to="/" class="flex items-center space-x-2 group">
                    <div class="w-8 h-8 bg-gradient-to-br from-blue-600 to-purple-600 rounded-lg flex items-center justify-center">
                        <span class="text-white font-bold text-sm">B</span>
                    </div>
                    <span class="text-xl font-semibold text-gray-900 group-hover:text-blue-600 transition-colors duration-200">
                        BSI Shop
                    </span>
                </RouterLink>

                <!-- Desktop Navigation -->
                <nav class="hidden md:flex items-center space-x-8">
                    <RouterLink 
                        v-for="route in routes" 
                        :key="route.path"
                        :to="route.path" 
                        class="text-gray-600 hover:text-gray-900 transition-colors duration-200 font-medium relative group"
                        active-class="text-blue-600"
                    >
                        {{ route.name }}
                        <span class="absolute -bottom-1 left-0 w-0 h-0.5 bg-blue-600 transition-all duration-200 group-hover:w-full"></span>
                    </RouterLink>
                </nav>

                <!-- Mobile menu button -->
                <button 
                    @click="toggleMenu"
                    class="md:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200"
                >
                    <svg 
                        class="w-6 h-6 text-gray-600" 
                        :class="{ 'rotate-90': isMenuOpen }"
                        fill="none" 
                        stroke="currentColor" 
                        viewBox="0 0 24 24"
                    >
                        <path 
                            stroke-linecap="round" 
                            stroke-linejoin="round" 
                            stroke-width="2" 
                            d="M4 6h16M4 12h16M4 18h16"
                        />
                    </svg>
                </button>
            </div>

            <!-- Mobile Navigation -->
            <div 
                v-show="isMenuOpen"
                class="md:hidden py-4 border-t border-gray-100 mt-4"
            >
                <nav class="flex flex-col space-y-4">
                    <RouterLink 
                        v-for="route in routes" 
                        :key="route.path"
                        :to="route.path" 
                        @click="isMenuOpen = false"
                        class="text-gray-600 hover:text-gray-900 transition-colors duration-200 font-medium py-2"
                        active-class="text-blue-600"
                    >
                        {{ route.name }}
                    </RouterLink>
                </nav>
            </div>
        </div>
    </header>
</template>

<style scoped>
.router-link-active .group span {
    width: 100%;
}
</style>