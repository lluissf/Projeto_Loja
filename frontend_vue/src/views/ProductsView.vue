<template>
    <div class="">
        <h1>Lista de Produtos</h1>
        <ul>
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