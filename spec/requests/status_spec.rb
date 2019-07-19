require 'rails_helper'

RSpec.describe 'Status requests' do

  describe 'GET /status' do
    it 'returns a status message' do
      get('/status')
      json_response = JSON.parse(response.body)

      expect(json_response['status']).to eql('ok')
    end
  end

  describe 'GET /pets' do
    it 'returns json data' do
      get('/pets')
      json_response = JSON.parse(response.body)

      expect(json_response.flatten).to include('franky')
    end
  end

  describe 'GET /consoles' do
    it 'has NES as the first named console' do
      get('/consoles')
      json_response = JSON.parse(response.body)

      expect(json_response['consoles'][0]['name']).to eql('NES')
    end

    it 'has PS2 as the last named console' do
      get('/consoles')
      json_response = JSON.parse(response.body)
      json_manufacturers = json_response['consoles'].map {|c| c["manufacturer"]}
      json_manufacturers_uniq = json_manufacturers.uniq

      expect(json_response['consoles'][json_response['consoles'].length-1]['name']).to eql('PS2')
      expect(json_manufacturers).to include('Sega')
      expect(json_manufacturers.length).to eql(7)
      expect(json_manufacturers_uniq.length).to eql(3)
    end

    it 'has 7 consoles listed' do
      get('/consoles')
      json_response = JSON.parse(response.body)
      json_manufacturers = json_response['consoles'].map {|c| c["manufacturer"]}
      json_manufacturers_uniq = json_manufacturers.uniq

      expect(json_manufacturers_uniq.length).to eql(3)
    end

    it 'has 3 manufacturers' do
      get('/consoles')
      json_response = JSON.parse(response.body)
      json_manufacturers = json_response['consoles'].map {|c| c["manufacturer"]}
      json_manufacturers_uniq = json_manufacturers.uniq

      expect(json_manufacturers.length).to eql(7)
    end

    it 'supports specifying consoles for a specific manufacturer' do
      # get '/consoles', params: { 'manufacturer': 'Nintendo'}
      get '/consoles?manufacturer=Nintendo'
      # get('/consoles', params: { manufacturer: 'Nintendo'})

      json_response = JSON.parse(response.body)
      nintendo_consoles = ['NES', 'SNES', 'Wii', 'Switch']

      expect(json_response['nintendo_consoles']).to eql(nintendo_consoles)
    end
  end
end
