Dir[File.join(File.dirname(__FILE__), "../pages/*_page.rb")].each {|file| require file}

module Pages

    #metodos facilitadores para instanciar as classes
    
    def api_covenant
        @api_covenant ||= Covenant.new
    end

    def login
        @login ||= LoginPage.new
    end

    def keycloak
        @keycloak ||= GetToken.new
    end 

    def beat_tables
        @beat_tables ||= BeatTables.new
    end 
    
end    
