const routes = [
    {
        name: 'Home Page',
        path: '/',
        component: () => import('@/views/HomePage.vue')
    },
    {
        name: 'About Page',
        path: '/about',
        component: () => import('@/views/AboutPage.vue')
    },
    {
        name: 'Products Page',
        path: '/products',
        component: () => import('@/views/ProductsPage.vue')
    }
]
export { routes }