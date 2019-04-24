require 'airborne'
require 'json'
require_relative 'specs'

token = generateToken('test_user')
auth_header = { 'Authorization' => 'Bearer ' + token }

describe 'should create or update the user object' do

  it "when post it's to the API" do
    get API + '/user', auth_header
    user = JSON.parse(body)

    user['idUser'] = nil
    user['alias'] = 'TestUser'
    post_body = user.to_json

    post API + '/user', post_body, auth_header
    expect_status 200
    expect_json(idUser: 'test_user', alias: 'TestUser')

    user['alias'] = 'TestABC'
    post_body = user.to_json

    post API + '/user', post_body, auth_header
    expect_status 200
    expect_json(idUser: 'test_user', alias: 'TestABC')
  end
end
