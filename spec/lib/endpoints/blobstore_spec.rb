require 'lib/setup_api'

RSpec.describe NexusAPI do


  describe 'Blobstores Endpoint' do
    include_context 'setup NexusAPI::API'

    describe '#list_blobstores' do
      it 'send a get to v1/blobstores' do
        url = "#{BASE_URL}/v1/blobstores"
        stub_request(:get, url)
          .with(headers: { 'Content-Type'=>'application/json' })
        api.list_blobstores
        expect(a_request(:get, url)).to have_been_made
      end
    end

    describe '#delete_blobstore' do
      let(:blobstore) { 'default' }

      it 'sends a delete to v1/blobstores with blobstore name' do
        url = "#{BASE_URL}/v1/blobstores/#{blobstore}"
        stub_request(:delete, url)
          .with(headers: { 'Content-Type'=>'application/json' })
        expect(api.delete_blobstore(name: blobstore)).to be(true)
        expect(a_request(:delete, url)).to have_been_made
      end
    end
  end
end