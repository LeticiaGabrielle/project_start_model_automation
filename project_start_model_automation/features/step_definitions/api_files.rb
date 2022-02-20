Dado('que eu envie os parametros para o endpoint') do
    keycloak.authenticate
    UploadApi.new.signed_url
end

Quando('recebo uma url para subir o arquivo xls') do
    keycloak.authenticate
    UploadApi.new.send_arq
end    

Entao('valido que meu arquivo foi enviado com sucesso.') do
    keycloak.authenticate
    @sucess = UploadApi.new.get    
    expect(@sucess.body).to include "rolAnsOK.xlsx"
    expect(@sucess.code).to eql(200)
end

Dado('que tenho as tabelas enviadas na base') do
    keycloak.authenticate
    @sucess_all = UploadApi.new.get
end

Entao('o retorno será a consulta das tabelas com sucesso.') do
    expect(@sucess_all.code).to eql(200)
end


Quando('envio o endpoint com o file name desejado') do
    keycloak.authenticate
    UploadApi.new.file_name
end

Entao('o retorno sera uma url para download do arquivo') do
    keycloak.authenticate
    @url_download = UploadApi.new.link_download
    expect(@url_download.code).to eql(200)
    log("To download, click on the url or copy and paste in the browser: \n"+@url_download)
end

Quando('envio o endpoint com o arquivo que desejo deletar') do
    keycloak.authenticate
    @file = UploadApi.new.file_name
    @url = UploadApi.new.delete_file
end

Entao('o arquivo sera deletado.') do
    expect(@url.code).to eql(200)
    expect(@url['list'][0]['originalName']).not_to eql("rolAnsOK.xlsx")
end

Dado('que eu envie os parametros para o endpoint da tabela tuss') do
    keycloak.authenticate
    UploadApi.new.signed_url_tuss
end
  
Quando('recebo uma url para enviar a tabela em formato xls') do
    keycloak.authenticate
    UploadApi.new.send_tuss_table
end
  
Entao('valido que o arquivo da tabela tuss foi enviada com sucesso.') do 
    @tuss_table = UploadApi.new.get_tuss  
    expect(@tuss_table.code).to eql(200)  
    expect(@tuss_table.body).to include "tussOK.xlsx"
end 