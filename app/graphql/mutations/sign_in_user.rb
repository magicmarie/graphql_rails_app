module Mutations
  class SignInUser < BaseMutation

    argument :email, Types::AuthProvider, required false

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email: nil)
      return unless email

      user = User.find_by email: email[:email]

      return unless user
      return unless user.authenticate(email[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      context[:session][:token] = token

      { user: user, token: token }
    end
  end
end