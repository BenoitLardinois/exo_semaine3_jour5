#UTILISATION DE LA GEM WATIR

require 'watir'


#WITH CHROME
=begin
caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" =>  {'detach' => true})

browser = Watir::Browser.new :chrome, desired_capabilities: caps 
browser.goto 'google.com'

On a side note! this might give a problem when you are running multiple scenario tests, chromedriver will actively refuse connection in case an other test initiates in the same chrome session. Ensure you have browser.close whenever required.
=end





=begin
require 'launchy'

browser = Launchy::Browser.new.visit(:"http://www.google.be/")

search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")

#méthode de la barre d'entrée
search_bar.send_keys(:enter)

#méthode du clic
#submit_button = browser.button(type:"submit")
#submit_button.click
=end






#WITH FIREFOX
def openbrowser
  browser = Watir::Browser.new(:firefox)
  browser.goto 'google.com'

  search_bar = browser.text_field(class: 'gsfi')
  search_bar.set("Hello World!")

  #méthode de la barre d'entrée
  #search_bar.send_keys(:enter)

  #méthode du clic
  submit_button = browser.button(type:"submit")
  submit_button.click
  
  #attendre un peu avant de continuer
  browser.driver.manage.timeouts.implicit_wait = 10
  
  #la recherche !prend tous les divs concernés, et les met dans une array
  search_result_divs = browser.divs(class:"rc")
  
  #passer sur les éléments de cette array et récupérer le texte
  search_result_divs.each { |div| p div.h3.text}
  
  p "Méfait accompli, fermeture du browser"
  
  #sleep 30
  
  browser.close
end
openbrowser

















