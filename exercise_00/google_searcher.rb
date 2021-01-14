require 'watir'
require 'launchy'
require 'pry'

def check_if_user_gave_input
  abort("missing input, plz write a text after $ ruby google_searcher.rb") if ARGV.empty?
end

def get_input
  return the_input = ARGV.join
end

def open_browser(name)
  browser = Watir::Browser.new(:firefox)
  browser.goto 'google.com'

  search_bar = browser.text_field(class: 'gsfi')
  search_bar.set(name)

  #méthode de la barre d'entrée
  search_bar.send_keys(:enter)

  sleep 30
  
  browser.close
end

 open_browser(ARGV)

def perform
  check_if_user_gave_input
  the_input = get_input
  open_browser(the_input)
end

perform

#A CORRIGER, PROBLEME AVEC L'ESPACE DES TEXTE