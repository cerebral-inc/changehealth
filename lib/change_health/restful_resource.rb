module ChangeHealth
  class RestfulResource < Request

    def post_list(params = {})
      post(resource_base, params)
    end

    # def read(id)
    #   get(resource_path(id))
    # end

    def list()
      get(resource_base)
    end

    def list_all(params = {})
      params_with_pagination =
        params.
        delete_if { |k, v| k.to_s.start_with?('page') }. # delete all previous pagination params
        merge(page_size: 1000) # set the maximum page size

      first_page = list(params_with_pagination).data

      results = first_page['results']
      (first_page['count'].to_i / 1000).times do |offset|
        page_data = list(params_with_pagination.merge(page: offset + 2)).data
        results += page_data['results']
      end

      results
    end

    # def list_with_params(params = {})
    #   path = path_with_params(resource_base, params)
    #   get(path)
    # end

    def resource_base
      "/medicalnetwork/#{self.class.name.demodulize.downcase}/#{self.class.parent.name.split("::").last.downcase}"
    end

    # def resource_path(id)
    #   "#{resource_base}/#{id}"
    # end

    # def path_with_params(path, params)
    #   [path, '/?', params.to_query].join
    # end

  end

end
