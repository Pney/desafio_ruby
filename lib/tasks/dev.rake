DEFAULT_PASSWORD = user
namespace :dev do
  desc "Reiniciando BD"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando_BD...")          {   %x(rails db:drop)          }
      show_spinner("Criando_BD...")           {   %x(rails db:create)        }  
      show_spinner("Migrando_BD...")          {   %x(rails db:migrate)       } 
      show_spinner("Cadastrando o Usuário Padrão...")          {   %x(rails dev:add_default_user)       } 
    #   show_spinner("Cadastrando o Administrador Padrão...")          {   %x(rails dev:add_default_admin)       } 
    #   show_spinner("Cadastrando Usuários Extras...")          {   %x(rails dev:add_extra_user)       } 
      # %x(rails dev:add_mining_types)
    else
      puts "Você não está em um ambiente de Desenvolvimento"
    end
  
  end

  desc "Criando Usuário Padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@teste.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
    
# #   desc "Criando Admin Padrão"
# #   task add_default_admin: :environment do
# #     Admin.create!(
# #       email: 'admin@teste.com',
# #       password: DEFAULT_PASSWORD,
# #       password_confirmation: DEFAULT_PASSWORD
# #     )
# #   end
  
#   desc "Criando Users Extras"
#   task add_extra_user: :environment do
#     10.times do
#       User.create!(
#         email: Faker::Internet.email,
#         password: DEFAULT_PASSWORD,
#         password_confirmation: DEFAULT_PASSWORD
#       )
#     end
#   end
#   private

#   def show_spinner(msg_start, msg_end = "Concluído!")
#     spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
#     spinner.auto_spin
#     yield
#     spinner.success("(#{msg_end})")
#   end

end
