<script setup>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

const selectedCategory = ref('all')
const searchQuery = ref('')
const sortBy = ref('name')
const produtos = ref([]) // Produtos do backend
const loading = ref(true)
const error = ref(null)

const categories = ref([
  { id: 'all', name: 'Todos' },
  { id: 'electronics', name: 'Eletrônicos' },
  { id: 'computers', name: 'Computadores' },
  { id: 'audio', name: 'Áudio' },
  { id: 'gaming', name: 'Games' }
])

// Produtos mock para demonstração visual
const mockProducts = ref([
  {
    id: 'mock-1',
    name: "iPhone 15 Pro",
    price: 8999.00,
    originalPrice: 9999.00,
    image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=300&fit=crop",
    category: "electronics",
    rating: 4.8,
    reviews: 127,
    inStock: true
  },
  {
    id: 'mock-2',
    name: "MacBook Pro M3",
    price: 12999.00,
    image: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop",
    category: "computers",
    rating: 4.9,
    reviews: 89,
    inStock: true
  },
  {
    id: 'mock-3',
    name: "AirPods Pro",
    price: 1299.00,
    originalPrice: 1499.00,
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop",
    category: "audio",
    rating: 4.7,
    reviews: 203,
    inStock: true
  }
])

// Combinar produtos do backend com produtos mock
const allProducts = computed(() => {
  const backendProducts = produtos.value.map(produto => ({
    id: produto.id,
    name: produto.nome,
    price: parseFloat(produto.preco.replace('R$ ', '').replace(',', '.')),
    image: "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop",
    category: "electronics",
    rating: 4.5,
    reviews: 45,
    inStock: true
  }))
  
  return [...backendProducts, ...mockProducts.value]
})

const filteredProducts = computed(() => {
  let filtered = allProducts.value

  // Filter by category
  if (selectedCategory.value !== 'all') {
    filtered = filtered.filter(product => product.category === selectedCategory.value)
  }

  // Filter by search query
  if (searchQuery.value) {
    filtered = filtered.filter(product => 
      product.name.toLowerCase().includes(searchQuery.value.toLowerCase())
    )
  }

  // Sort products
  return filtered.sort((a, b) => {
    switch (sortBy.value) {
      case 'price-low':
        return a.price - b.price
      case 'price-high':
        return b.price - a.price
      case 'rating':
        return (b.rating || 0) - (a.rating || 0)
      default:
        return a.name.localeCompare(b.name)
    }
  })
})

const formatPrice = (price) => {
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL'
  }).format(price)
}

// Carregar produtos do backend
onMounted(async () => {
  try {
    const response = await axios.get('http://127.0.0.1:8000/api/produtos/')
    produtos.value = response.data
  } catch (err) {
    error.value = 'Erro ao carregar produtos do servidor'
    console.error('Erro:', err)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header -->
    <section class="bg-white py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-4xl font-bold text-gray-900 mb-4">
            Nossos Produtos
          </h1>
          <p class="text-xl text-gray-600 max-w-2xl mx-auto">
            Descubra nossa seleção cuidadosa de produtos de alta qualidade
          </p>
        </div>
      </div>
    </section>

    <!-- Filters -->
    <section class="bg-white border-b border-gray-200 sticky top-16 z-40">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex flex-col lg:flex-row gap-6">
          <!-- Search -->
          <div class="flex-1">
            <div class="relative">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                </svg>
              </div>
              <input 
                v-model="searchQuery"
                type="text" 
                placeholder="Buscar produtos..."
                class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent outline-none"
              >
            </div>
          </div>

          <!-- Category Filter -->
          <div class="lg:w-48">
            <select 
              v-model="selectedCategory"
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent outline-none"
            >
              <option 
                v-for="category in categories" 
                :key="category.id" 
                :value="category.id"
              >
                {{ category.name }}
              </option>
            </select>
          </div>

          <!-- Sort -->
          <div class="lg:w-48">
            <select 
              v-model="sortBy"
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent outline-none"
            >
              <option value="name">Nome A-Z</option>
              <option value="price-low">Menor Preço</option>
              <option value="price-high">Maior Preço</option>
              <option value="rating">Melhor Avaliado</option>
            </select>
          </div>
        </div>
      </div>
    </section>

    <!-- Loading State -->
    <div v-if="loading" class="py-16 text-center">
      <div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
      <p class="mt-4 text-gray-600">Carregando produtos...</p>
    </div>

    <!-- Error State -->
    <div v-else-if="error" class="py-16 text-center">
      <div class="text-red-500 mb-4">
        <svg class="w-16 h-16 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
      </div>
      <h3 class="text-xl font-semibold text-gray-900 mb-2">{{ error }}</h3>
      <p class="text-gray-600">Mostrando produtos de demonstração</p>
    </div>

    <!-- Products Grid -->
    <section class="py-12">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Results count -->
        <div class="mb-8">
          <p class="text-gray-600">
            Mostrando {{ filteredProducts.length }} produtos
          </p>
        </div>

        <!-- Products -->
        <div v-if="filteredProducts.length > 0" class="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
          <div 
            v-for="product in filteredProducts" 
            :key="product.id"
            class="bg-white rounded-2xl shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden group"
          >
            <!-- Product Image -->
            <div class="relative overflow-hidden">
              <img 
                :src="product.image" 
                :alt="product.name"
                class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
              >
              
              <!-- Sale badge -->
              <div 
                v-if="product.originalPrice" 
                class="absolute top-3 left-3 bg-red-500 text-white px-2 py-1 rounded-full text-xs font-semibold"
              >
                OFERTA
              </div>

              <!-- Stock status -->
              <div 
                v-if="!product.inStock"
                class="absolute top-3 right-3 bg-gray-800 text-white px-2 py-1 rounded-full text-xs font-semibold"
              >
                Esgotado
              </div>

              <!-- Quick view button -->
              <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-all duration-300 flex items-center justify-center">
                <button class="bg-white text-gray-900 px-4 py-2 rounded-lg font-semibold opacity-0 group-hover:opacity-100 transform translate-y-2 group-hover:translate-y-0 transition-all duration-300">
                  Ver Detalhes
                </button>
              </div>
            </div>

            <!-- Product Info -->
            <div class="p-6">
              <!-- Rating -->
              <div v-if="product.rating" class="flex items-center mb-2">
                <div class="flex items-center">
                  <span v-for="i in 5" :key="i" class="text-yellow-400">
                    <svg 
                      :class="i <= Math.floor(product.rating) ? 'fill-current' : 'text-gray-300'"
                      class="w-4 h-4" 
                      viewBox="0 0 24 24"
                    >
                      <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>
                  </span>
                </div>
                <span class="text-sm text-gray-600 ml-2">
                  {{ product.rating }} ({{ product.reviews || 0 }})
                </span>
              </div>

              <!-- Product name -->
              <h3 class="text-lg font-semibold text-gray-900 mb-3 line-clamp-2">
                {{ product.name }}
              </h3>

              <!-- Price -->
              <div class="flex items-center justify-between">
                <div>
                  <span class="text-2xl font-bold text-gray-900">
                    {{ formatPrice(product.price) }}
                  </span>
                  <span 
                    v-if="product.originalPrice" 
                    class="text-sm text-gray-500 line-through ml-2"
                  >
                    {{ formatPrice(product.originalPrice) }}
                  </span>
                </div>
                
                <button 
                  :disabled="!product.inStock"
                  :class="(product.inStock !== false)
                    ? 'bg-blue-600 hover:bg-blue-700 text-white' 
                    : 'bg-gray-300 text-gray-500 cursor-not-allowed'"
                  class="px-4 py-2 rounded-lg font-semibold transition-colors duration-200"
                >
                  {{ (product.inStock !== false) ? 'Comprar' : 'Esgotado' }}
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- No products found -->
        <div v-else class="text-center py-16">
          <div class="text-gray-400 mb-4">
            <svg class="w-16 h-16 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
            </svg>
          </div>
          <h3 class="text-xl font-semibold text-gray-900 mb-2">
            Nenhum produto encontrado
          </h3>
          <p class="text-gray-600">
            Tente ajustar os filtros ou termos de busca
          </p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>