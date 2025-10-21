<script setup>
import { ref } from 'vue'

const team = ref([
  {
    name: "Ana Silva",
    role: "CEO & Fundadora",
    image: "https://images.unsplash.com/photo-1494790108755-2616b612b601?w=400&h=400&fit=crop&crop=face",
    description: "Visionária por trás da BSI Shop, com mais de 10 anos de experiência em e-commerce."
  },
  {
    name: "Carlos Santos", 
    role: "CTO",
    image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop&crop=face",
    description: "Especialista em tecnologia, responsável por toda a infraestrutura e inovação."
  },
  {
    name: "Maria Costa",
    role: "Head de Design",
    image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=400&fit=crop&crop=face", 
    description: "Designer criativa que transforma ideias em experiências visuais incríveis."
  }
])

const values = ref([
  {
    icon: "⚡",
    title: "Inovação",
    description: "Sempre buscamos as melhores tecnologias e tendências para oferecer produtos únicos."
  },
  {
    icon: "🤝",
    title: "Confiança",
    description: "Construímos relacionamentos duradouros baseados na transparência e qualidade."
  },
  {
    icon: "🌟",
    title: "Excelência",
    description: "Comprometidos em superar expectativas em cada interação com nossos clientes."
  },
  {
    icon: "🌱",
    title: "Sustentabilidade",
    description: "Responsabilidade ambiental e social são pilares fundamentais do nosso negócio."
  }
])
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section -->
    <section class="relative bg-white py-24">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
            Sobre a 
            <span class="bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
              BSI Shop
            </span>
          </h1>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            Nascemos da paixão por conectar pessoas aos melhores produtos do mercado. 
            Nossa missão é transformar a experiência de compras online em algo simples, 
            confiável e prazeroso.
          </p>
        </div>
      </div>
    </section>

    <!-- Story Section -->
    <section class="py-20 bg-gray-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-2 gap-16 items-center">
          <div>
            <h2 class="text-3xl font-bold text-gray-900 mb-6">
              Nossa História
            </h2>
            <p class="text-gray-600 mb-6 leading-relaxed">
              Fundada em 2020, a BSI Shop começou como uma pequena startup com um grande sonho: 
              democratizar o acesso a produtos de qualidade através da tecnologia.
            </p>
            <p class="text-gray-600 mb-6 leading-relaxed">
              Desde então, crescemos para nos tornar uma das principais plataformas de e-commerce 
              do país, servindo mais de 50.000 clientes satisfeitos e oferecendo mais de 10.000 
              produtos cuidadosamente selecionados.
            </p>
            <p class="text-gray-600 leading-relaxed">
              Nossa jornada é impulsionada pela inovação constante e pelo compromisso inabalável 
              com a satisfação do cliente.
            </p>
          </div>
          <div class="relative">
            <img 
              src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=600&h=400&fit=crop" 
              alt="Nossa equipe"
              class="rounded-2xl shadow-lg"
            >
            <div class="absolute -bottom-6 -right-6 w-24 h-24 bg-gradient-to-br from-blue-600 to-purple-600 rounded-xl opacity-20"></div>
          </div>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section class="py-20 bg-white">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-900 mb-4">
            Nossos Valores
          </h2>
          <p class="text-gray-600 max-w-2xl mx-auto">
            Os princípios que nos guiam em cada decisão e interação
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div 
            v-for="value in values" 
            :key="value.title"
            class="text-center p-6 rounded-2xl border border-gray-100 hover:border-blue-200 hover:shadow-lg transition-all duration-300"
          >
            <div class="text-4xl mb-4">{{ value.icon }}</div>
            <h3 class="text-xl font-semibold text-gray-900 mb-3">
              {{ value.title }}
            </h3>
            <p class="text-gray-600 leading-relaxed">
              {{ value.description }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section class="py-20 bg-gray-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-900 mb-4">
            Nossa Equipe
          </h2>
          <p class="text-gray-600 max-w-2xl mx-auto">
            Conheça as pessoas apaixonadas que tornam a BSI Shop possível
          </p>
        </div>

        <div class="grid md:grid-cols-3 gap-12">
          <div 
            v-for="member in team" 
            :key="member.name"
            class="text-center group"
          >
            <div class="relative mb-6">
              <img 
                :src="member.image" 
                :alt="member.name"
                class="w-32 h-32 rounded-full mx-auto object-cover shadow-lg group-hover:shadow-xl transition-shadow duration-300"
              >
              <div class="absolute inset-0 w-32 h-32 rounded-full mx-auto bg-gradient-to-br from-blue-600/20 to-purple-600/20 group-hover:from-blue-600/30 group-hover:to-purple-600/30 transition-all duration-300"></div>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">
              {{ member.name }}
            </h3>
            <p class="text-blue-600 font-medium mb-4">
              {{ member.role }}
            </p>
            <p class="text-gray-600 leading-relaxed">
              {{ member.description }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-white">
      <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl font-bold text-gray-900 mb-4">
          Junte-se à Nossa Jornada
        </h2>
        <p class="text-gray-600 mb-8">
          Descubra por que milhares de pessoas confiam na BSI Shop para suas compras online
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <RouterLink 
            to="/products" 
            class="bg-blue-600 text-white px-8 py-4 rounded-xl font-semibold hover:bg-blue-700 transition-all duration-200 shadow-lg hover:shadow-xl"
          >
            Explorar Produtos
          </RouterLink>
          <a 
            href="mailto:contato@bsishop.com" 
            class="border-2 border-gray-300 text-gray-700 px-8 py-4 rounded-xl font-semibold hover:border-blue-600 hover:text-blue-600 transition-all duration-200"
          >
            Entre em Contato
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<style> 
</style>
