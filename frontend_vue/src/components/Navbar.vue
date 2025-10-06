<script setup>
</script>
<template>
    <header class="bg-white shadow">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-bold text-gray-800">My Vue App</h1>
            <nav>
                <RouterLink to="/" class="text-gray-600 hover:text-gray-800 mx-2">Home</RouterLink>
                <RouterLink to="/about" class="text-gray-600 hover:text-gray-800 mx-2">About</RouterLink>
                <RouterLink to="/products" class="text-gray-600 hover:text-gray-800 mx-2">Produtos</RouterLink>
            </nav>
        </div>
    </header>
</template>