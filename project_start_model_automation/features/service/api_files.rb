require_relative 'keycloak.rb' #usar herança keycloak
class UploadApi < GetToken
    
    include HTTParty
    base_uri($env['api_signed_url'])

    def signed_url
        body = {
            "fileName": "rolAnsOK.xlsx", "type": "rolAns" }
        url = self.class.post('/', 
                                    body: body,
                                    headers: { "Authorization": "Bearer #{@@token}" })
        @@result = url.parsed_response['signedUrl']
    end

    def send_arq
        #precisa passar o caminho com ", 'rb'" para que o arq possa ser enviado no tamanho correto
        a = File.new("features/fixtures/ROLANS/rolAnsOK.xlsx", 'rb').read
        self.class.put(@@result, 
                                    body: a,)
    end

    def get
        self.class.get('/rolans', headers: { 'Authorization' => "Bearer #{@@token}" })
    end
   

    def file_name
        response = self.class.get('/rolans', headers: { 'Authorization' => "Bearer #{@@token}" })  
        #passando atributo file name do primeiro array para variavel 
        @@name_xls = response['list'][0]['fileName']
    end

    def link_download
        #chamando api e passando a variavel com o file name
        @download = self.class.get("/download/#{@@name_xls}",
                                         headers: { 'Authorization' => "Bearer #{@@token}" })
    end

    def delete_file
        delete = self.class.delete("/#{@@name_xls}",
                                     headers: { 'Authorization' => "Bearer #{@@token}" })
        response = self.class.get('/rolans',
                                     headers: { 'Authorization' => "Bearer #{@@token}" })
    end

    def signed_url_tuss
        body = {
            "fileName": "tussOK.xlsx", "type": "tuss" }
        url = self.class.post('/',
                                     body: body,
                                     headers: { 'Authorization' => "Bearer #{@@token}" })
        @@response = url.parsed_response['signedUrl']
        # Kernel.puts @@response
    end

    def send_tuss_table
        a = File.new("features/fixtures/TUSS/tussOK.xlsx", 'rb').read
        self.class.put(@@response,
                                     body: a)
    end

    def get_tuss
        self.class.get('/tuss',
                         headers: { 'Authorization' => "Bearer #{@@token}" })
    end

end
