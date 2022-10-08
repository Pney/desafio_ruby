class User < ApplicationRecord
    belongs_to :to_do, optional: true
    belongs_to :log_login, optional: true
    belongs_to :status_list, optional: true
    has_many :visits, class_name: "Ahoy::Visit"
    require "cpf_cnpj"

    VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :name_user, presence: true, length: {minimum: 3, maximum: 50}
    validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: true
    validates :phone, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates_cpf_format_of :cpf

    has_secure_token :token_public
end
