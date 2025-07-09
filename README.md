# Desafio: Protótipo de Cardápio Digital - DevBurger

Bem-vindo(a) ao desafio de desenvolvimento do protótipo de um cardápio digital para a nossa nova hamburgueria gourmet, a "DevBurger"!

O objetivo é criar uma aplicação web simples e funcional utilizando Node.js e Express. Nesta primeira fase, não nos preocuparemos com bancos de dados; toda a lógica de exibição e recebimento de dados será gerenciada diretamente pelo servidor.

## Visão Geral do Projeto

Este projeto consiste em um pequeno servidor web que apresenta o cardápio da hamburgueria e permite que os clientes enviem sugestões de novos lanches. É uma excelente oportunidade para praticar conceitos fundamentais de back-end com Node.js, como a criação de servidores, o gerenciamento de rotas e o tratamento de formulários.

## Estrutura de Arquivos

Para manter o projeto organizado, tente seguir a seguinte estrutura de diretórios e arquivos:

```bash
devburger/
├── public/
│   ├── css/
│   │   └── style.css
│   ├── images/
│   │    └── logo.png (opcional)
│   ├── data
│   │     └── lanches.json
│   └── 404.html (opcional)
│
├── views/
│   ├── index.html
│          .       
│          .
│          .
│
├── .gitignore
├── package-lock.json
├── package.json
├── README.md
└── server.js
```

- **`public/`**: Contém todos os arquivos estáticos que serão servidos diretamente ao cliente, como folhas de estilo (CSS), imagens, arquivos JSON e scripts do lado do cliente.
- **`views/`**: Contém os templates de arquivos HTML estáticos que serão servidos por cada endpoint
- **`server.js`**: O coração da nossa aplicação, onde o servidor Express será configurado e todas as rotas serão definidas.
- **`package.json`**: Arquivo de manifesto do projeto Node.js, que inclui as dependências (como o Express).
- **`README.md`**: Este arquivo, com a documentação do projeto.

## Como Iniciar o Servidor

Siga os passos abaixo para configurar e rodar o projeto em sua máquina local.

**1. Clone o Repositório (ou crie o projeto do zero)**

Se você estiver baixando este projeto, clone o repositório. Se estiver começando do zero, crie a estrutura de arquivos acima.

**2. Instale as Dependências**

Navegue até o diretório raiz do projeto pelo terminal e instale o Express.js:

```bash
npm install express
```
Se você estiver recebendo os dados do formulário via POST, precisará de um middleware para interpretar o corpo da requisição. O Express já inclui o express.urlencoded.

**3. Inicie o Servidor**

Execute o seguinte comando no terminal:

```bash
node server.js
```

O servidor será iniciado, e você deverá ver uma mensagem no console, por exemplo:

Servidor da DevBurger rodando em http://localhost:3000
Agora, você pode abrir seu navegador e acessar http://localhost:3000.

## Rotas Implementadas
A aplicação possui as seguintes rotas:

**1. Rota Raiz:** ```GET /```

- **Descrição:** Serve a página principal da aplicação (index.html), que exibe o cardápio da "DevBurger" e um formulário para que os clientes possam sugerir um novo sabor de lanche.

- **Método:** ```GET```
  
- **Status code esperado**: ```200```

- **Resposta:** Conteúdo do arquivo index.html.

**2. Rota de Sugestão:** ```GET /sugestao?nome=<nome-do-lanche>&ingredientes=<lista-de-ingredientes>```

- Descrição: Recebe os dados enviados pelo formulário da página inicial. O servidor processa esses dados e exibe uma página de agradecimento personalizada.

- **Método:** ```GET```

- **Status code esperado**: ```200```

- **Resposta:** Serve a página obrigado.html com os dados passados no formulário da rota raíz.

- **Observação:** o envio do formulário deve ser feito utilizando query string.

**3. Página de contatos:** ```GET /contato```

- **Descrição:** Serve a página de de contato (contato.html), que exibe um formulário para que os clientes possam enviar mensagens.
  
- **Método:** ```GET```

- **Status code esperado**: ```200```
  
- **Resposta:** conteúdo do arquivo contato.html.

**4. Página de contato recebido:** ```POST /contato```

- **Descrição:** Recebe os dados do cliente e do contato fornecidos no formulário da página de contato. O servidor processa esses dados e exibe a página de contato recebido.
  
- **Método:** ```POST```

- **Status code esperado**: ```200```
  
- **Corpo da requisição (Payload):**
   - nome (String): nome do cliente
   - email (String): e-mail do cliente
   - assunto (String): assunto do contato
   - mensagem (String): mensagem explicando o motivo do contato
     
- **Resposta:** Serve a página contato-recebido.html, que exibe os dados enviados pelo usuário no payload dinamicamente.
  
**5. API de Lanches:** ```GET /api/lanches```

- **Descrição:** Uma rota de API simulada que retorna uma lista de lanches pré-definidos em formato JSON. Ideal para ser consumida por um futuro front-end dinâmico.

- **Método:** ```GET```

- **Status code esperado**: ```200```

- **Resposta:** ```application/json``` com a seguinte estrutura:

**JSON**
```
[
  {
    "id": 1,
    "nome": "DevBurger Clássico",
    "ingredientes": "Pão brioche, Carne 150g, Queijo cheddar, Alface americana, Tomate fresco, Molho especial"
  },
  {
    "id": 2,
    "nome": "Bugger de Bacon",
    "ingredientes": "Pão australiano, Carne 180g, Queijo prato, Bacon crocante, Cebola caramelizada, Molho barbecue"
  },
  {
    "id": 3,
    "nome": "Commit Veggie",
    "ingredientes": "Pão integral, Burger de grão de bico, Queijo vegano, Rúcula, Tomate seco, Maionese de ervas"
  }
]
```

## Views:
Deverão ser implementadas as seguintes views com as seguintes especificações:

**1. index.html:**
- **Descrição:** template exibido na rota raíz ```/```. 
- **Requisitos**: deve possuir, pelo menos, um formulário com os campos ```nome``` e ```ingredientes``` (utilize tags ```<input>``` ou ```<textarea>```) e um botão de tipo submit, além de âncoras (tag <a>) para a rota de contato ```/contato``` e para a API simulada ```/api/lanches```. Layout e estilização ficam ao seu critério.
- **OBS:** é altamente recomendado o uso da tag label, juntamente com os campos do formulário.

**2. Página de agradecimento**
- **Descrição:** template exibido após uma requisição ```GET``` à ```/sugestao```. 
- **Requisitos:** deverá exibir uma mensagem de agradecimento pela sugestão e os dados inseridos no formulário durante seu envio, presente nos parâmetros da URL. 

**3. contato.html:**
- **Descrição:** template exibido após uma requisição ```GET``` à ```/contato```
- **Requisitos:** deve conter um formulário com os campos de ```nome```, ```email```, ```assunto``` e ```mensagem```, um botão do tipo "submit" e uma âncora (tag <a>) para à rota raíz ```/```.
- **OBS:** é altamente recomendado o uso da tag label, juntamente com os campos do formulário.

**4. Página de contato recebido:**
- **Descrição:** template exibido após uma requisição ```POST``` à ```/contato```
- **Requisitos:** deve exibir uma mensagem de agradecimento pela mensagem, os dados passados no formulário da página ```contato.html``` e possuir uma âncora para a rota raíz ```/```

**5. 404.html (opcional):**
- **Descrição:** template exibido quando uma rota não existente é acessada. 
- **Requisitos:** deve conter uma mensagem de erro qualquer e uma âncora para a rota raíz ```/```

## Opcional:

### Tratamento de Página Não Encontrada (Erro 404)
- Foi implementado um middleware no final da cadeia de rotas em server.js.

- Se uma requisição chegar ao servidor e não corresponder a nenhuma das rotas definidas (/, /sugestao, /contato, /api/lanches), o servidor responderá com um status 404 e uma página de erro amigável, informando ao usuário que a página não foi encontrada.

### Uso do padrão PRG (POST, REDIRECT, GET)

- Ao realizar a requisição ```POST /contato``` o servidor recebe o payload, o processa e retorna uma ordem de redirecionamento para a rota ```/contato-recebido```.

- O servidor realiza a ordem com uma requisição ```GET``` para a rota especificada, servindo a página de ```/contato-recebido```.
