# frozen_string_literal: true

require 'rails_helper'

# testing requests
RSpec.describe ServerController, type: :controller do

  it 'returns http success' do
    get :result, params: { num: 10000 }
    expect(response.status).to eq(200)
  end

  it 'returns correct result' do
    get :result, params: { num: 100000 }
    expect(assigns[:res_arr]).to eq [3, 7, 31, 127, 8191]
  end

  it 'returns different result' do
    get :result, params: { num: 30000 }
    expect(assigns[:res_arr]).to eq [3, 7, 31, 127, 8191]
  end

  it 'show in xml' do
    get :result, params: {  num: 30000 , format: :xml }
    expect(response.content_type).to eq('application/xml; charset=utf-8')
  end

  it 'show in html' do
    get :result, params: { num: 30000, format: :html }
    expect(response.content_type).to eq('text/html; charset=utf-8')
  end
end
