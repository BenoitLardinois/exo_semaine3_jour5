def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_a_readme
  file = File.open("Readme.md", "a")
  file.puts('"This is a ruby program"')
end

def create_a_gemfile
  file = File.open("Gemfile", "a")
  file.puts("source 'https://rubygems.org'", "ruby '2.7.1'", "gem 'pry'", "gem 'rspec'", "gem 'ruby_gem'", "gem 'rubocop'")
  system("bundle install")
  file.close  
end

def create_an_env
  file = File.new(".env", "a")
  file.puts("secret file!")
  file.close
end

def create_a_gitignore
  file = File.new(".gitignore", "a")
  file.puts(".env")
  file.close
end

def perform
  check_if_user_gave_input
  folder_name = get_folder_name
  create_folder(folder_name)
  create_folder("#{folder_name}/lib")
  Dir.chdir(folder_name) do
    system("git init")
    system("rspec --init")
  end
  create_a_readme
  create_a_gemfile
  create_an_env
  create_a_gitignore
end

perform

