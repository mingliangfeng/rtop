require 'rtop'
require 'rtop/generators/config'

describe RTop::RTop do
  
  it "get taobao item information" do
    item = RTop::RTop.new(File.join('config', 'taobao.yml')).get_item(1500022659003)
    item.should_not equal(nil)
    item["title"].should_not equal(nil)
  end
  
  
  it "generate the taobao configuration file taobao.yml" do
    RTop::Generators::Config.start()
  end
  
  it "version test" do
    RTop::Generators::Config.start()
  end
  
  it "generate the taobao configuration file taobao.yml" do
    RTop::Runner.start()
  end

end