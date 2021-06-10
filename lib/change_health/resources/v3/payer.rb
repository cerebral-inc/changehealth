module ChangeHealth
  module Resources
    class Payer < RestfulResource
      public :list, :read, :list_all

      def resource_base
        "https://connectcenter.changehealthcare.com/publicApi/payer/getPayerList?eligExist=true"
      end
    end
  end
end
