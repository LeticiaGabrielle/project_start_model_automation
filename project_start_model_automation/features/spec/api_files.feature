#language: pt

@smc75 @ok @api
Funcionalidade: Upload arquivo da tabela 

@put_rol
Cenario: signed URL para enviar um novo arquivo com sucesso no submódulo tabela Rol ANS
Dado que eu envie os parametros para o endpoint
Quando recebo uma url para subir o arquivo xls
Entao valido que meu arquivo foi enviado com sucesso.

@get_rol
Cenario: Consultar tabelas do submódulo tabela Rol ANS
Dado que tenho as tabelas enviadas na base
Entao o retorno será a consulta das tabelas com sucesso.

@download_rol
Cenario: Download tabela do submódulo tabela Rol ANS
Dado que tenho as tabelas enviadas na base
Quando envio o endpoint com o file name desejado
Entao o retorno sera uma url para download do arquivo

@delete_rol
Cenario: Deletar tabela do submódulo tabela Rol ANS
Dado que tenho as tabelas enviadas na base
Quando envio o endpoint com o arquivo que desejo deletar
Entao o arquivo sera deletado.

@put_tuss
Cenario: signed URL para enviar um novo arquivo com sucesso no submódulo tabela TUSS
Dado que eu envie os parametros para o endpoint da tabela tuss
Quando recebo uma url para enviar a tabela em formato xls
Entao valido que o arquivo da tabela tuss foi enviada com sucesso.