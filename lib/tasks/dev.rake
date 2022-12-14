DEFAULT_PASSWORD = "asdasd"
Faker::Config.locale = "pt-BR"
namespace :dev do
  desc "Reiniciando BD"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando_BD...")          {   %x(rails db:drop)          }
      show_spinner("Criando_BD...")           {   %x(rails db:create)        }  
      show_spinner("Migrando_BD...")          {   %x(rails db:migrate)       } 
      show_spinner("Cadastrando o Usuário Padrão...")          {   %x(rails dev:add_default_user)       } 
      show_spinner("Cadastrando Usuários Extras...")          {   %x(rails dev:add_extra_user)       } 
      show_spinner("Cadastrando Listas To_Do...")          {   %x(rails dev:add_to_do)       } 
      # %x(rails dev:add_mining_types)
    else
      puts "Você não está em um ambiente de Desenvolvimento"
    end
  
  end
# USERS
# :name_user
# :email
# :phone
# :cpf
# :gender
# :profile

  desc "Criando Usuário Padrão"
  task add_default_user: :environment do
    User.create!(
      image_profile: Faker::Avatar.image(slug: "my-own-slug"),
      name_user: "Faker", 
      email: 'user@teste.com',
      phone: '45999999999',
      cpf: CPF.generate,
      gender: "Masculino",
      profile: "Escolar",
      public_permission: true
    )
    LogLogin.create!(user: User.last)
  end
    
# #   desc "Criando Admin Padrão"
# #   task add_default_admin: :environment do
# #     Admin.create!(
# #       email: 'admin@teste.com',
# #       password: DEFAULT_PASSWORD,
# #       password_confirmation: DEFAULT_PASSWORD
# #     )
# #   end
  
  desc "Criando Users Extras"
  task add_extra_user: :environment do
    10.times do    
      User.create!(
        image_profile: Faker::Avatar.image(),
        name_user: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        cpf: CPF.generate,
        gender: Faker::Gender.type,
        profile: ("Guest"),
        public_permission: true
      )
      LogLogin.create!(user: User.last)
    end
  end

  desc "Criando Log de Criação de LogIn"
  task add_log_login: :environment do
    
  end
  #PROFILE
  #Guest
  #Back
  #Front

  #GENERO
  #Feminino
  #Masculino
  #Outro

  desc "Criando To_Do Extras"
  task add_to_do: :environment do
    # byebug
    User.all.each do |user|
      
      StatusList.create!(
        title: "Aberto",
        user: user
      )
      StatusList.create!(
        title: "Em Progresso",
        user: user
      )
      StatusList.create!(
        title: "Em Impedimento",
        user: user
      )
      StatusList.create!(
        title: "Pronto",
        user: user
      )
    end

    ToDo.create!(
      uni_code: "AAAAAA",
      title: "Criação de um Botão",
      description: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
      category: "Front",
      status_list: StatusList.last,
      public_permission: true,
      user: User.first
    )
    ToDo.create!(
      uni_code: Faker::Lorem.characters(number: 6),
      title: "Organizar equipe de Desenvolvimento",
      description: Faker::Lorem.sentence(word_count: 7),
      category: "Suporte",
      status_list: StatusList.first,
      public_permission: true,
      user: User.first
    )
    ToDo.create!(
      uni_code: Faker::Lorem.characters(number: 6),
      title: "Reunião com Cliente",
      description: Faker::Lorem.sentence(word_count: 7),
      category: "Suporte",
      status_list: StatusList.first,
      public_permission: true,
      user: User.first
    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
