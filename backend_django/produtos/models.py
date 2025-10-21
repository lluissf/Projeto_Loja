from django.db import models

class Produto(models.Model):
    nome = models.CharField(max_length=100)
    imagem = models.URLField()
    descricao = models.TextField(blank=True)
    preco = models.DecimalField(max_digits=8, decimal_places=2)
    estoque = models.IntegerField(default=0)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.nome

class Categoria(models.Model):
    nome = models.CharField(max_length=50)
    produtos = models.ManyToManyField(Produto, related_name='categorias')
    def __str__(self):
        return self.nome

class Carrinho(models.Model):
    produtos = models.ManyToManyField(Produto, through='ItemCarrinho')
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)
    def __str__(self):
        return f'Carrinho {self.id}'

class ItemCarrinho(models.Model):
    carrinho = models.ForeignKey(Carrinho, on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)
    quantidade = models.PositiveIntegerField(default=1)
