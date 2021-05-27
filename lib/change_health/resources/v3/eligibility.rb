module ChangeHealth
  module Resources
    module V3
      class Eligibility < RestfulResource
        INFO = {
          "controlNumber": "123456789",
          "tradingPartnerServiceId": "serviceId",
          "provider": {
              "organizationName": "provider_name",
              "npi": "0123456789",
              "serviceProviderNumber": "54321",
              "providerCode": "AD",
              "referenceIdentification": "54321g"
          },
          "informationReceiverName": {
              "address": {
                  "address1": "123 address1",
                  "city": "city1",
                  "state": "wa",
                  "postalCode": "981010000"
              }
          },
          "subscriber": {
              "memberId": "0000000000",
              "firstName": "johnOne",
              "lastName": "doeOne",
              "gender": "M",
              "dateOfBirth": "18800102",
              "groupNumber": "1111111111",
              "address": {
                  "address1": "123 address1",
                  "city": "city1",
                  "state": "wa",
                  "postalCode": "981010000"
              }
          },
          "dependents": [
              {
                  "memberId": "0000000000",
                  "firstName": "janeOne",
                  "lastName": "doeOne",
                  "gender": "F",
                  "dateOfBirth": "18160421",
                  "groupNumber": "1111111111",
                  "address": {
                      "address1": "123 address1",
                      "city": "city1",
                      "state": "wa",
                      "postalCode": "981010000"
                  },
                  "additionalIdentification": {}
              }
          ]
        }

        public :create

        # def resource_base
        #   "eligibility/v3/"
        # end
      end
    end
  end
end
