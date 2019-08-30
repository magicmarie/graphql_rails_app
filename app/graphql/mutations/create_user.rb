module  Mutations
  class CreateUser < BaseMutation
    # args passed to resolved mtd
    class AuthProviderSignupData < Types::BaseInputObject
         argument :email, Types::AuthProvider, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false


    type Types::UserType

    def resolve(description: nil, url: nil)
      user.create!(
          name: name,
          email: auth_provider&.[](:email)&.[](:email),
          password: auth_provider&.[](:email)&.[](:password)
          )
    end
  end
end