require_relative './../../models/account'
class UpdateAccountsApiKeys < ActiveRecord::Migration[5.0]
  def change
    ::Account.all.each do |account|
      key = ""
      30.times do
        key << ('a'..'z').to_a.sample
      end
      account.update(api_key: key)
    end
  end
end
