# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  email             :string(255)      not null
#  name              :string(255)      not null
#  password_digest   :string(255)      not null
#  remember_digest   :string(255)
#  admin             :boolean          default(FALSE)
#  activation_digest :string(255)
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  reset_digest      :string(255)
#  reset_sent_at     :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # describe 'ユーザー登録' do
  #   before do
  #     puts 'before'
  #   end

  #   context 'should be valid' do
  #     before do
  #     end

  #     it 'base' do
  #       # user = User.new(name: "Example User", email: "user@example.com",
  #       #   password: 'password', password_confirmation: 'password')
  #       user = FactoryBot.build(:aoba)
  #       expect(user).to be_valid
  #     end
  #   end
  # end

  # describe '四則演算' do
  #   it '全部できること' do
  #     expect(1 + 2).to eq 3
  #     expect(10 - 1).to eq 9
  #     expect(4 * 8).to eq 32
  #     expect(40 / 5).to eq 8
  #   end
  # end

  describe 'ここにはクラスもかける' do
    describe '#age ageメソッドをテストする' do
      before do
        puts '毎回呼ばれる'
      end

      context '条件や状況1' do
        puts '1'
      end
      context '条件や状況2' do
        puts '2'
      end
    end
  end
end
