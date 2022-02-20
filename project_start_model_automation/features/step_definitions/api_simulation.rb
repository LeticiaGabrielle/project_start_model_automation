Dado('que solicite a url informando os parametros necessários') do
    keycloak.authenticate
    @report = Simulation.new.download_simulation
end
  
Então('o retorno será um array com a url da simulação.') do
    Kernel.puts "URL to download the simulation:".blue
    Kernel.puts (@report).blue
end

Dado('que eu faço o download de uma simulação') do
  keycloak.authenticate
  @response = Simulation.new.download_simulation
end

Quando('faço a análise dentro do arquivo') do
  Simulation.new.structure 
end

Entao('vejo que a análise da estrutura da simulação foi um sucesso.') do
  expect($validation).to eql("***Column structuring of simulation completed successfully***")
end