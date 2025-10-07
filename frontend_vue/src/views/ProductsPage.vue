<template>
    <div class="container mx-auto px-4 py-4">
        <h1 class="text-2xl font-bold mb-4">Lista de Produtos</h1>
        <hr class="mb-4">
        <ul class="list-disc list-inside">
            <li v-for="produto in produtos" :key="produto.id">
                {{ produto.nome }} - {{ produto.preco }}
            </li>
        </ul>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
import axios from 'axios';
const produtos = ref([]); 
axios.get('http://127.0.0.1:8000/api/produtos/')
  .then(response => {
    produtos.value = response.data;
  })
</script>