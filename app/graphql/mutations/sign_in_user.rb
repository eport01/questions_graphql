module Mutations
  class SignInUser < Mutations::BaseMutation
    null true

    # argument :credentials, Types::AuthProviderCredentialsInput, required: false

    argument :name, String, required: true
    argument :email, String, required: true 
    argument :token, String, required: true 
    argument :uid, String, required: true 
    # field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil, name: nil, token: nil, uid: nil)
      # basic validation
      # return unless credentials

      user = User.find_by email: email 

      # ensures we have the correct user
      return unless user
      # return unless user.authenticate(credentials[:password])

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      # token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      # context[:session][:token] = token
      
      { user: user}
    end
  end
end