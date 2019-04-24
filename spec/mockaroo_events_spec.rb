require 'airborne'
require_relative 'specs'
require_relative 'schema'

validKey = { :key => M_KEY }
invalidKey = { :key => 'abc' }

describe 'Events GET endpoint' do

  it 'should return success when valid key is provided' do

    get MOCKAROO_MY_API + '/event.json', :params => validKey

    expect_status 200
    expect_json_types(EVENT_SCHEMA)
    expect_json_types('costs.*', COST_SCHEMA)
  end

  it 'should return error when invalid key is provided' do

    get MOCKAROO_MY_API + '/event.json', :params => invalidKey

    expect_status 500
    expect_json(error: 'Invalid API Key')

  end

  it 'should return correct number of object when qparam count is provided' do

    get MOCKAROO_MY_API + '/event.json', :params => validKey.merge!('count': '3')

    expect_status 200
    expect_json_sizes(3)
  end

end

