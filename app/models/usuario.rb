class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Relación uno uno para configuración
  has_one :config

  before_destroy :delete_config

  def delete_config
  	self.config.destroy
  end
end
