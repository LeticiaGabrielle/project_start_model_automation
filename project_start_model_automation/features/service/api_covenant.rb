require_relative 'keycloak.rb' #usar herança keycloak
class Covenant < GetToken

    include HTTParty
    base_uri($env['api_covenant'])

    def get_all
        self.class.get('/',
                       headers: {"Authorization": "Bearer #{@@token}"})
    end

    def get_id
        convenio = self.class.get('/',
                                 headers: {"Authorization": "Bearer #{@@token}"})
        @@id_conv = convenio.parsed_response[5]['id']
    end

    def get_brands
        brands = self.class.get("/#{@@id_conv}/brands",
                                headers: {"Authorization": "Bearer #{@@token}"})
    end

    def id_brands
        brands = self.class.get("/#{@@id_conv}/brands",
                                headers: {"Authorization": "Bearer #{@@token}"}) 
        @@id_marca = brands.parsed_response[0]['id']

        ### esse convenio tem uma marca com alphaconvenio para teste
        # brands = self.class.get("/302/brands")
    end

    def get_alphas
        @@alphas = self.class.get("/#{@@id_conv}/brands/#{@@id_marca}/alfas",
                                  headers: {"Authorization": "Bearer #{@@token}"}) 

        ### esse convenio e essa marca tem alphaconvenios
        # @@alphas = self.class.get("/302/brands/2/alfas")          
    end
end




