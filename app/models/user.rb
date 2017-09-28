class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 定义birthday栏位信息的处理方法
  def birthday=(str)
    if $APP["birthday_format"] == "big-endian"
      arr = str.split(/[-\/. ]/)
      year = arr[0].to_i
      month = arr[1].to_i
      day = arr[2].to_i

      year += (year < 18 ? 2000 : 1900) if year < 100

      parsed_date = Date.new(year, month, day)
    elsif $APP["birthday_format"] == "little-endian"
      arr = str.split(/[-\/. ]/)
      year = arr[2].to_i
      month = arr[1].to_i
      day = arr[0].to_i

      year += (year < 18 ? 2000 : 1900) if year < 100

      parsed_date = Date.new(year, month, day)
    elsif $APP["birthday_format"] == "middle-endian"
      arr = str.split(/[-\/. ]/)
      year = arr[2].to_i
      month = arr[0].to_i
      day = arr[1].to_i

      year += (year < 18 ? 2000 : 1900) if year < 100

      parsed_date = Date.new(year, month, day)
    end

    write_attribute(:birthday, parsed_date)
  end
end
