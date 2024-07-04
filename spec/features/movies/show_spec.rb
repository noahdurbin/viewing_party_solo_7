require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'displays a movies information' do
    it 'shows a movies title and other details' do
      user1 = User.create(name: 'Noah', email: 'ndurbin@gmail.com')
    end

    it 'contains a link to return to the discover page' do
    end

    it 'contains a link to create a viewing party' do
    end
  end
end
