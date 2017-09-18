class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable, :trackable,
    :rememberable, :recoverable,
    omniauth_providers: %i(github facebook twitter)
  has_many :providers

  def admin?
    self.admin
  end

  def authorized_by(provider: nil)
    self.providers.where(provider: provider).exists?
  end
end