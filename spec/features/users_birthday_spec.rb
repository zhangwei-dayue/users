require 'rails_helper'

feature "测试不同格式生日日期", :type => :feature do

  context "日期格式设置为big-endian" do
    before do
      # 把日期格式设置为big-endian
      $APP["birthday_format"] == "big-endian"
    end

    scenario "注册用户生日格式为:2016-01-11, 预期结果为2016-01-11" do
      visit "/users/sign_up"  # 浏览注册页面
      expect(page).to have_content("Sign up")
      within("#new_user") do  # 填表单
        fill_in "邮箱", with: "test1@example.com"
        fill_in "生日", with: "2016-01-11"
        fill_in "密码", with: "123456"
        fill_in "再次确认", with: "123456"
      end

      click_button "Sign up"
      # 检查注册成功后的页面文字。看是否有刚更新的用户的生日信息

      expect(page).to have_content("2016-01-11")

      # 检查数据库里面最后一笔真的有刚刚填的资料

      user = User.last
      expect(user.birthday).to eq("2016-01-11")
    end

    scenario "注册用户生日格式为:17.2/12, 预期结果为2017-02-12" do
      visit "/users/sign_up"  # 浏览注册页面
      expect(page).to have_content("Sign up")
      within("#new_user") do  # 填表单
        fill_in "邮箱", with: "test1@example.com"
        fill_in "生日", with: "17.2/12"
        fill_in "密码", with: "123456"
        fill_in "再次确认", with: "123456"
      end

      click_button "Sign up"
      # 检查注册成功后的页面文字。看是否有刚更新的用户的生日信息

      expect(page).to have_content("2017-02-12")

      # 检查数据库里面最后一笔真的有刚刚填的资料

      user = User.last
      expect(user.birthday).to eq("2017-02-12")
    end

    scenario "注册用户生日格式为:89-03 13, 预期结果为1989-03-13" do
      visit "/users/sign_up"  # 浏览注册页面
      expect(page).to have_content("Sign up")
      within("#new_user") do  # 填表单
        fill_in "邮箱", with: "test1@example.com"
        fill_in "生日", with: "89-03 13"
        fill_in "密码", with: "123456"
        fill_in "再次确认", with: "123456"
      end

      click_button "Sign up"
      # 检查注册成功后的页面文字。看是否有刚更新的用户的生日信息

      expect(page).to have_content("1989-03-13")

      # 检查数据库里面最后一笔真的有刚刚填的资料

      user = User.last
      expect(user.birthday).to eq("1989-03-13")
    end

    scenario "注册用户生日格式为:二零一二年十月十二日, 预期结果为2012-10-12" do
      visit "/users/sign_up"  # 浏览注册页面
      expect(page).to have_content("Sign up")
      within("#new_user") do  # 填表单
        fill_in "邮箱", with: "test1@example.com"
        fill_in "生日", with: "二零一二年十月十二日"
        fill_in "密码", with: "123456"
        fill_in "再次确认", with: "123456"
      end

      click_button "Sign up"
      # 检查注册成功后的页面文字。看是否有刚更新的用户的生日信息

      expect(page).to have_content("2012-10-12")

      # 检查数据库里面最后一笔真的有刚刚填的资料

      user = User.last
      expect(user.birthday).to eq("2012-10-12")
    end

    scenario "注册用户生日格式为:2011年4月5日, 预期结果为2011-04-05" do
      visit "/users/sign_up"  # 浏览注册页面
      expect(page).to have_content("Sign up")
      within("#new_user") do  # 填表单
        fill_in "邮箱", with: "test1@example.com"
        fill_in "生日", with: "2011年4月5日"
        fill_in "密码", with: "123456"
        fill_in "再次确认", with: "123456"
      end

      click_button "Sign up"
      # 检查注册成功后的页面文字。看是否有刚更新的用户的生日信息

      expect(page).to have_content("2011-04-05")

      # 检查数据库里面最后一笔真的有刚刚填的资料

      user = User.last
      expect(user.birthday).to eq("2011-04-05")
    end
  end
end
