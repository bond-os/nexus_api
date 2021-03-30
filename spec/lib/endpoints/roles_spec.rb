require 'lib/setup_api'

RSpec.describe NexusAPI do
  describe 'Roles Endpoint' do
    include_context 'setup NexusAPI::API'

    let(:id) { 'id' }

    describe '#list_roles' do
      it 'sends a get to /v1/security/roles' do
        url = "#{BASE_URL}/v1/security/roles"
        stub_request(:get, url)
          .with(headers: { 'Content-Type'=>'application/json' })
        api.list_roles
        expect(a_request(:get, url)).to have_been_made
      end
    end

    describe '#create_role' do
      let(:name) { 'name' }
      let(:description) { 'description' }
      let(:privileges) { ['privilege'] }
      let(:roles) { ['role'] }

      it 'sends a post to /v1/security/roles with required info' do
        url = "#{BASE_URL}/v1/security/roles"
        stub_request(:post, url)
          .with(body: {
            'id' => id,
            'name' => name,
            'description' => description,
            'privileges' => privileges,
            'roles' => roles
          }).with(headers: { 'Content-Type'=>'application/json' })
        api.create_role(
          id: id,
          name: name,
          description: description,
          privileges: privileges,
          roles: roles
        )
        expect(a_request(:post, url)).to have_been_made
      end

      it 'sends a post to /v1/security/roles with a default description' do
        url = "#{BASE_URL}/v1/security/roles"
        stub_request(:post, url)
          .with(body: {
            'id' => id,
            'name' => name,
            'description' => nil,
            'privileges' => privileges,
            'roles' => roles
          }).with(headers: { 'Content-Type'=>'application/json' })
        api.create_role(id: id, name: name, privileges: privileges, roles: roles)
        expect(a_request(:post, url)).to have_been_made
      end

      it 'sends a post to /v1/security/roles with a default privileges' do
        url = "#{BASE_URL}/v1/security/roles"
        stub_request(:post, url)
          .with(body: {
            'id' => id,
            'name' => name,
            'description' => description,
            'privileges' => [],
            'roles' => roles
          }).with(headers: { 'Content-Type'=>'application/json' })
        api.create_role(id: id, name: name, description: description, roles: roles)
        expect(a_request(:post, url)).to have_been_made
      end

      it 'sends a post to /v1/security/roles with a default roles' do
        url = "#{BASE_URL}/v1/security/roles"
        stub_request(:post, url)
          .with(body: {
            'id' => id,
            'name' => name,
            'description' => description,
            'privileges' => privileges,
            'roles' => []
          }).with(headers: { 'Content-Type'=>'application/json' })
        api.create_role(id: id, name: name, description: description, privileges: privileges)
        expect(a_request(:post, url)).to have_been_made
      end
    end

    describe '#list_role' do
      it 'sends a get to /v1/security/roles/{id}?source=default' do
        url = "#{BASE_URL}/v1/security/roles/#{id}?source=default"
        stub_request(:get, url)
          .with(headers: { 'Content-Type'=>'application/json' })
        api.list_role(id: id)
        expect(a_request(:get, url)).to have_been_made
      end
    end

    describe '#delete_role' do
      it 'sends a delete to /v1/security/roles/{roleId}' do
        url = "#{BASE_URL}/v1/security/roles/#{id}"
        stub_request(:delete, url)
          .with(headers: { 'Content-Type'=>'application/json' })
        api.delete_role(id: id)
        expect(a_request(:delete, url)).to have_been_made
      end
    end
  end
end
