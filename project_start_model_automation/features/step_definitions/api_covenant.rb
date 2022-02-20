Dado('que solicite a lista de convênios') do
    keycloak.authenticate
    @all_list = Covenant.new.get_all
  end
  
  Então('o retorno será toda a lista de convênios para consulta.') do
    expect(@all_list.code).to eql(200)
    #  Kernel.puts (@all_list.body).green
  end
  
  Quando('informo o id de um convênio no endpoint') do
    keycloak.authenticate
    Covenant.new.get_id
  end
  
  Então('deve retornar as marcas desse convênio') do
    keycloak.authenticate
    @all_brands = Covenant.new.get_brands
    expect(@all_brands.code).to eql(200)    
    expect(@all_brands.body).to include "id"
    expect(@all_brands.body).to include "name"
  end

  Quando('informo o id de um convênio e o id de uma marca no endpoint') do
    keycloak.authenticate
    Covenant.new.id_brands
  end
  
  Então('se houver alphaconvênios dessa marca deve ser retornado.') do
    keycloak.authenticate
    @all_alphas = Covenant.new.get_alphas
    expect(@all_alphas.code).to eql(200)

      if @all_alphas.body == "[]"
        Kernel.puts "This brand has no alpha agreement".red
      else 
        Kernel.puts "This brand has the following alpha agreements:".green
        Kernel.puts (@all_alphas.body).green
      end  

  end
