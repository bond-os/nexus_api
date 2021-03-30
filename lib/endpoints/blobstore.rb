module NexusAPI
  class API
    # GET /service/rest/beta/blobstores
    def list_blobstores
      @connection.get_response(endpoint: 'blobstores', api_version: 'v1')
    end

    def list_blobstore_names
      list_blobstores.map { |blobstore| blobstore['name'] }
    end

    # GET /service/rest/v1/blobstores/{name}/quota-status
    def blobstore_quota_status(name:)

    end

    # DELETE /service/rest/beta/blobstores/{name}
    def delete_blobstore(name:)
        @connection.delete(endpoint: "blobstores/#{name}", api_version: 'v1')
      end

    # POST /service/rest/beta/blobstores/file
    # POST /service/rest/beta/blobstores/azure
    # POST /service/rest/beta/blobstores/s3
    def create_blobstore_file(name:, path:, options: {})
      parameters = ParameterBuilder.blobstore_file(name, path, options)
      create('blobstores/file', parameters)
    end

    def create_blobstore_azure(name:, options: {})
      parameters = ParameterBuilder.blobstore(name, options)
      create('blobstores/azure', parameters)
    end

    def create_blobstore_s3(name:, options: {})
      parameters = ParameterBuilder.blobstore(name, options)
      create('blobstores/s3', parameters)
    end

    # GET /service/rest/beta/blobstores/s3/{name}
    # GET /service/rest/beta/blobstores/azure/{name}
    # GET /service/rest/beta/blobstores/file/{name}

    # PUT /service/rest/beta/blobstores/s3/{name}
    # PUT /service/rest/beta/blobstores/azure/{name}
    # PUT /service/rest/beta/blobstores/file/{name}
    def update_blobstore(type:, name:)

    end

    private

    def create(endpoint, parameters)
      @connection.post(
        endpoint: endpoint,
        parameters: parameters,
        api_version: 'v1'
      )
    end
  end
end
