class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if (!self.nausea.nil? && !self.happiness.nil?)
      return 'sad' if self.nausea > self.happiness
      return 'happy' if self.happiness > self.nausea
    end
  end

end
