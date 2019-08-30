module Types
  class AuthProvider < BaseInputObject
    grapgql_name = 'AUTH_PROVIDER'

    argument :email, String, required: true
    argument :password, String, required: true

  end
end