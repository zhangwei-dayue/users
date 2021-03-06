## 實作Users专案


### 完成功能

* 用户可以注册、登录。
* 用户注册时可以输入生日保存，其中生日日期支持多种格式，程序会根据管理员设置的识别日期方式给予相应的生日日期格式提醒
- 管理员可以在app.yml配置文件中设置程序识别日期的方式，此配置文件随App启动加载。共有三种识别日期的方式(big-endian, little-endian, middle-endian)
- 完成了 big-endian, little-endian, middle-endian 三种方式下的自动化测试，共测试了5中生日日期输入格式(2016-01-11, 17.2/12, 89-03 13, 二零一二年十月十二日, 2011年4月5日)
* 已完成部署，可在线演示

### 兼容的日期格式

* 中文日期格式，如 2016年10月27日、二零一六年十月二十七日
* 分隔符：横线（-）、斜杠（/）、点（.）以及空格
* 年份，接受2-4个数字，如果年份小于18，视为2000 + n，例如 13 -> 2013，如果年份大于18且小于100，视为1900 + n，例如 89 -> 1989
* 日期和月份，可接受前导0，例如 03-21
