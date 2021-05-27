module ChangeHealth
  class RestfulResource < Request

    def create(params = {})
      post(resource_base, params)
    end

    # def read(id)
    #   get(resource_path(id))
    # end

    # def list()
    #   get(resource_base)
    # end

    # def list_with_params(params = {})
    #   path = path_with_params(resource_base, params)
    #   get(path)
    # end

    def resource_base
      "/medicalnetwork/#{self.class.name.demodulize.downcase}/#{self.class.parent.name.split("::").last.downcase}"
    end

    def resource_path(id)
      "#{resource_base}/#{id}"
    end

    # def path_with_params(path, params)
    #   [path, '/?', params.to_query].join
    # end

  end

end