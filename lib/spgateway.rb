class Spgateway
  mattr_accessor :merchant_id
  mattr_accessor :hash_key
  mattr_accessor :hash_iv
  mattr_accessor :url

  def initialize(payment)
    @payment = payment
    self.merchant_id = "MS36009955"
    self.hssh_key = "FmrhDli3LSAW4IqpsmUEiLI5b8fqZhgi"
    self.hash_iv = "Uqd5Ral3z9jpRzDh"
    self.url = "https://ccore.newebpay.com/MPG/mpg_gateway"
  end  

  def generate_form_data(return_url)
    spgateway_data = {
      MerchantID: self.merchant_id,
      Version: 1.5,
      RespondType:"JSON", 
      TimeStamp: @payment.created_at.to_i,
      MerchantOrderNo: "#{@payment.id}AC",
      Amt: @payment.amount,
      ItemDesc: @payment.order.name,
      Email: @order.user.email,
      LoginType: 0,
      ReturnURL: return_url
     }

    trade_info = self.encrypt(spgateway_data)
    trade_sha = self.class.generate_aes_sha256(trade_info)

    return{
      MerchantID: self.merchant_id,
      TradeInfo: trade_info,
      TradeSha: trade_sha,
      Version: '1.5'      
    }
  end    

  def encrypt(params_data)
    cipher = OpenSSL::Cipher::AES256.new(:CBC)
    cipher.encrypt
    cipher.key = self.hash_key
    cipher.iv  = self.hash_iv
    encrypted = cipher.update(params_data.to_query) + cipher.final
    aes = encrypted.unpack('H*').first
  end

  def self.generate_aes_sha256(trade_info)
    str = "HashKey=#{self.hash_key}&#{trade_info}&HashIV=#{self.hash_iv}"
    Digest::SHA256.hexdigest(str).upcase      
  end    
  
end  