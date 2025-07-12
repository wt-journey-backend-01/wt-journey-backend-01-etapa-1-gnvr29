const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, 'public')));

// Middleware para interpretar o corpo de requisições POST com URL encoded
app.use(express.urlencoded({ extended: true }));

// Rota Raiz: GET /
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views', 'index.html'));
});

// Rota de Sugestão: GET /sugestao
app.get('/sugestao', (req, res) => {
    const { nome, ingredientes } = req.query;
    const filePath = path.join(__dirname, 'public/views', 'obrigado.html');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            return res.status(500).send('Erro ao ler o arquivo de agradecimento.');
        }

        // Substitui os placeholders pelos dados da query string
        const responseHtml = data
            .replace('{{placeholder}}', 
                `<p><strong>Nome do Lanche:</strong> ${nome}</p>
                 <p><strong>Ingredientes:</strong> ${ingredientes}</p>`);

        res.status(200).send(responseHtml);
    });
});

// Rota para a página de contatos: GET /contato
app.get('/contato', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/views', 'contato.html'));
});

// Rota para receber dados do formulário de contato: POST /contato
app.post('/contato', (req, res) => {
    const { nome, email, assunto, mensagem } = req.body;
    const filePath = path.join(__dirname, 'public/views', 'contato-recebido.html');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            return res.status(500).send('Erro ao processar sua mensagem.');
        }

        // Substitui os placeholders pelos dados do corpo da requisição
        const responseHtml = data
            .replace('{{contato_placeholder}}', 
                `<p><strong>Nome:</strong> ${nome}</p>
                 <p><strong>E-mail:</strong> ${email}</p>
                 <p><strong>Assunto:</strong> ${assunto}</p>
                 <p><strong>Mensagem:</strong> ${mensagem}</p>`);
        
        res.status(200).send(responseHtml);
    });
});

// Rota da API de Lanches: GET /api/lanches
app.get('/api/lanches', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'data', 'lanches.json'));
});

// Middleware para tratamento de erro 404 (Página não encontrada)
// Deve ser o último middleware
app.use((req, res, next) => {
    res.status(404).sendFile(path.join(__dirname, 'public', '404.html'));
});


// Inicia o servidor
app.listen(PORT, () => {
    console.log(`Servidor da DevBurger rodando em http://localhost:${PORT}`);
});
