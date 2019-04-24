require 'airborne'
require_relative 'specs'
require 'faker'

validKey = { 'key' => M_KEY }

describe 'Should register a dataset' do

  it 'when plain text data is provided' do

    name = 'test' + Faker::Number.number(6)
    dataset = Faker::Name.first_name + ',' + Faker::Name.first_name

    post MOCKAROO_API + '/datasets/' + name, dataset, { :params => validKey, 'content-type' => 'text/csv' }

    expect_status 200
    expect_json(success: true)
  end

end

