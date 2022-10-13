require_relative '../lib/scrap_crypto.rb'

describe "scrap crypto" do

    it "return the name of crypto" do  
     expect(crypto(scrapper)).to include {"BTC"}
     expect(crypto(scrapper)).to include {"ETH"}
     expect(crypto(scrapper)).to include {"USDT"}
    end 

end