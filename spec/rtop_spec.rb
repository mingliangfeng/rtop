require 'rtop'
require 'rtop/generators/config'
require 'rtop/runner'

describe RTop::RTop do
  
  it "version test" do
    RTop::Runner.start(["-v"])
  end
  
  it "generate test" do
    RTop::Runner.start(["generate"])
  end
  
  it "get taobao item information" do
    item = RTop::RTop.new(File.join('config', 'taobao.yml')).get_item(1500022659003)
    item.should_not equal(nil)
    item["title"].should_not equal(nil)
  end

end