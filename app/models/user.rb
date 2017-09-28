class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 定义birthday栏位信息的处理方法
  def birthday=(str)
    if str =~ /(\p{Han}+|\d+)(年|月|日)/u #添加匹配中文日期格式的条件
      now = Time.now
      year = now.year
      month = now.month
      day = now.day

      str.scan(/(\p{Han}+|\d+)(年)(\p{Han}+|\d+)(月)(\p{Han}+|\d+)(日)/u) do
          year = $1.zen_to_i.to_i
          month = $3.zen_to_i.to_i
          day = $5.zen_to_i.to_i
      end

      parsed_date = Date.new(year, month, day)
    elsif $APP["birthday_format"] == "big-endian"
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
