# language: pt

@smc43 @api
Funcionalidade: Endpoint de download com URL para baixar o bate tabela

@download_simulation
Cenario: Obter url para download da simulação
Dado que solicite a url informando os parametros necessários
Então o retorno será um array com a url da simulação.

@structure
Cenario: Validação de estrutura fixa do bate de tabelas
Dado que eu faço o download de uma simulação
Quando faço a análise dentro do arquivo
Entao vejo que a análise da estrutura da simulação foi um sucesso.
