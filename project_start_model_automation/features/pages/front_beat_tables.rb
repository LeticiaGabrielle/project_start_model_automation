class BeatTables < SitePrism::Page

    set_url '/'
    element :simulador, :link, "Módulo Simulador"
    element :disa, '#txtDisa'
    element :vig, '.ant-picker-input' 
    element :today, '.ant-picker-today-btn'
    element :op, '#rc_select_4'
    element :opconv, '.ant-select-item-option-content'
    element :marc, '#rc_select_5'
    element :marcconv, '.ant-select-item-option-content'
    element :market, '#rc_select_6'
    element :campprivate, '.ant-select-item-option-content'
    element :regional, '#rc_select_7'
    element :reg1, '.ant-select-item-option-content'
    element :alfac, :xpath, './/span[(text()="Db-abas15")]'
    element :valm2, 'tbody tr:nth-child(1) > td:nth-child(6) > div > div > div > div > input'
    element :readjustment, 'tbody tr:nth-child(1) > td:nth-child(9) > div > div > div > div > input'
    element :limitrol, '.ant-switch'
    element :versiontuss, '#rc_select_8'
    element :version, :xpath,'.//div[@class="ant-select-item-option-content"][contains(.,"V.3.04 - V.2.02")]'
    element :validityrol, :xpath, './/input[@name="txtValidityRolPger"]'
    element :today, '.ant-picker-today-btn'

    def agreement_structure
        disa.set('5555555')
        vig.click
        today.click
        op.set('ABAS 15')
        opconv.click
        marc.set('Delboni Auriemo')
        marcconv.click
        market.set('Privado')
        campprivate.click
        regional.set('São Paulo')
        reg1.click
        alfac.click
    end    

    def scroll_down_page
        page.execute_script("window.scrollBy(0,9000)")
    end    

    def business_rules
        valm2.set('24,5')
        readjustment.set('4,7')
        limitrol.click
        versiontuss.click
        version.click
        validityrol.click
        today.click
    end   
    
    def attachments
        arqs = File.join(Dir.pwd, 'features/fixtures/test_attachments.txt')
        find(:xpath,'.//input[@type="file"]', visible: false).set(arqs)
    end

end