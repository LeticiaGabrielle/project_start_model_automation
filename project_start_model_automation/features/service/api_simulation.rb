require_relative 'keycloak.rb'
class Simulation < GetToken

    include HTTParty
    base_uri($env['api_simulation'])

    def download_simulation
        @query = {
            'fileType': "reports", #solicitar os reports ou attachments
            'simulationIds[]': "848", #inserir id da simulação q vem do bd
            'reportType': '"beatTables"'}
            
        report = self.class.get('/download',
                                 query: @query,
                                 headers: {"Authorization": "Bearer #{@@token}"})

     @@response = report.parsed_response[0]
    end

    def structure
        # gem para manipular dentro do excel
        analise = Roo::Spreadsheet.open("#{@@response}")
        @col1 = analise.sheet('Planilha 1').cell('A', 1).to_s 
        @col2 = analise.sheet('Planilha 1').cell('B', 1).to_s
        @col3 = analise.sheet('Planilha 1').cell('C', 1).to_s 
        @col4 = analise.sheet('Planilha 1').cell('D', 1).to_s
        @col5 = analise.sheet('Planilha 1').cell('E', 1).to_s 
        @col6 = analise.sheet('Planilha 1').cell('F', 1).to_s
        @col7 = analise.sheet('Planilha 1').cell('G', 1).to_s 
        @col8 = analise.sheet('Planilha 1').cell('H', 1).to_s
        @col9 = analise.sheet('Planilha 1').cell('I', 1).to_s 
        @col10 = analise.sheet('Planilha 1').cell('J', 1).to_s
        @col11 = analise.sheet('Planilha 1').cell('K', 1).to_s 
        @col12 = analise.sheet('Planilha 1').cell('L', 1).to_s
        @col13 = analise.sheet('Planilha 1').cell('M', 1).to_s 
        @col14 = analise.sheet('Planilha 1').cell('N', 1).to_s
        @col15 = analise.sheet('Planilha 1').cell('O', 1).to_s 
        @col16 = analise.sheet('Planilha 1').cell('P', 1).to_s
        @col17 = analise.sheet('Planilha 1').cell('Q', 1).to_s 
        @col18 = analise.sheet('Planilha 1').cell('R', 1).to_s
        @col19 = analise.sheet('Planilha 1').cell('S', 1).to_s 
        @col20 = analise.sheet('Planilha 1').cell('T', 1).to_s
        @col21 = analise.sheet('Planilha 1').cell('U', 1).to_s 
        @col22 = analise.sheet('Planilha 1').cell('V', 1).to_s
        @col23 = analise.sheet('Planilha 1').cell('W', 1).to_s 
        @col24 = analise.sheet('Planilha 1').cell('X', 1).to_s
        @col25 = analise.sheet('Planilha 1').cell('Y', 1).to_s 
        @col26 = analise.sheet('Planilha 1').cell('Z', 1).to_s
        @col27 = analise.sheet('Planilha 1').cell('AA', 1).to_s 
        @col28 = analise.sheet('Planilha 1').cell('AB', 1).to_s
        @col29 = analise.sheet('Planilha 1').cell('AC', 1).to_s 
    
    #Validação parte 2 da Analise do impacto financeiro
        @AIF1 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('A', 1).to_s 
        @AIF2 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('B', 1).to_s
        @AIF3 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('C', 1).to_s 
        @AIF4 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('D', 1).to_s
        @AIF5 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('E', 1).to_s 
        @AIF6 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('F', 1).to_s
        @AIF7 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('G', 1).to_s 
        @AIF8 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('H', 1).to_s
        @AIF9 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('I', 1).to_s 
        @AIF10 = analise.sheet('RESUMO IMPACTO FINANCEIRO').cell('J', 1).to_s
        

            if  @col1 == "alfaConvenios" &&
                @col2 == "Id marca" &&
                @col3 == "sigla exame" &&
                @col4 == "status" &&
                @col5 == "Tipo Exame" &&
                @col6 == "Cod Central TUSS" &&
                @col7 == "Descrição Central TUSS" &&
                @col8 == "ROL ANS" &&
                @col9 == "Exame Liberado na tabela" &&
                @col10 == "Cod AMB 14-10" &&
                @col11 == "Cod TUSS 14-10" &&
                @col12 == "Cod Pacote 14-10" &&
                @col13 == "QTD CH 14-10" &&
                @col14 == "M2 filme 14-10" &&
                @col15 == "Valor Filme 14 -10" &&
                @col16 == "Valor com Filme 14-10" &&
                @col17 == "Valor Total Final 14-10" &&
                @col18 == "Exame contratado" &&
                @col19 == "COD TUSS Genética" &&
                @col20 == "COD PACOTE Genética" &&
                @col21 == "COD Pacote" &&
                @col22 == "COD Própria" &&
                @col23 == "Valor CONV" &&
                @col24 == "M2 FILME" &&
                @col25 == "VALOR FILME" &&
                @col26 == "Valor do Filme calculado" &&
                @col27 == "Valor Total Final" &&
                @col28 == "Regra" &&
                @col29 == "Analise"

                #COLUNAS REFERENTE PARTE 1 DA ANALISE DO IMPACTO FINANCEIRO
                @col30 == "FREQUENCIA ULTIMOS 12 MESES"
                @col31 == "VALOR ATUAL X FREQUENCIA"
                @col32 == "VALOR NOVO X FREQUENCIA"
                @col33 == "VALOR DE IMPACTO"
                @col34 == "% IMPACTO"

                #COLUNAS REFERENTE PARTE 2 DA ANALISE DO IMPACTO FINANCEIRO
                @AIF1 == "REGIONAL" 
                @AIF2 == "MARCA"
                @AIF3 == "ALFA CONVENIO"
                @AIF4 == "VALOR IMPACTO POSITIVO"
                @AIF5 == "FREQUENCIA ULTIMOS 12 MESES"
                @AIF6 == "VALOR BLOQUEAR EXAMES"
                @AIF7 == "DIFERENÇA DE VALOR"
                @AIF8 == "FATURAMENTO ATUAL"
                @AIF9 == "FATURAMENTO PREVISTO"
                @AIF10 == "% DE IMPACTO"


                $validation = "***Column structuring of simulation completed successfully***"
            else 
                $validation = "XXXX-Failure in structuring simulation columns-XXXX"
            end  

            Kernel.puts ($validation).blue
    end    
end
