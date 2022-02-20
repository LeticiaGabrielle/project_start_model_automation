Dado('que tenho uma tabela de convenio como referência') do
    login.load
    page.windows[0].maximize
    login.keycloak
    upload_covenant.preencher_own
    upload_covenant.input_own
end
  
  Quando('preencho todos os dados na tela do registro da simulação') do
    click_on('Módulo Simulador')
    beat_tables.estrutura_convenio
    beat_tables.scroll_down_page
    beat_tables.regras_comerciais
    beat_tables.attachments
end
  
  Quando('clico no botão {string}') do |gerar|
    find(:xpath,'.//button[contains(.,"Gerar Simulação")]').click
    sleep(3)
end
  
  Entao('recebo a mensagem {string} que a simulação foi criada.') do |toast_sucess|
    toast_sucess_var = first('.ant-notification-notice-message')
    expect(toast_sucess_var.text).to eql toast_sucess
end
