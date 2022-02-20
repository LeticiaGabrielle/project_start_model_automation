# language: pt

@smc131 @ok @api
Funcionalidade: Listagem dos convênio, marcas e alpha convênios
Como sistema
Quero receber a listagem dos convênios, marcas e alpha convênios
Para poder utilizar no preenchimento dos dados do sub módulo tabela convênio


@all_covenant
Cenario: Obter toda a lista de convênios.
Dado que solicite a lista de convênios
Então o retorno será toda a lista de convênios para consulta.

@brands_covenant
Cenario: Obter todas as marcas relacionadas a um convênio.
Quando informo o id de um convênio no endpoint
Então deve retornar as marcas desse convênio

@alpha_covenant
Cenario: Obter os alphaconvênios relacionada a uma marca de um convênio.
Quando informo o id de um convênio e o id de uma marca no endpoint
Então se houver alphaconvênios dessa marca deve ser retornado.