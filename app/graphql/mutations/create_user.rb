module Mutations

    class CreateUser < Mutations::BaseMutation

      # class AuthProviderSignupData < Types::BaseInputObject
      #   argument :credentials, Types::AuthProviderCredentialsInput, required: false
      # end

      argument :name, String, required: true
      # argument :auth_provider, AuthProviderSignupData, required: false
      argument :email, String, required: true 
      argument :token, String, required: true 
      argument :uid, String, required: true 

      # type Types::UserType
      field :user, Types::UserType, null: true
      # field :token, String, null: true

      # field :user, Types::UserType, null:false 
      field :errors, [String], null: false 
      def resolve(name:, email:, token:, uid:)
        user = User.create!(
          name: name,
          email: email,
          token: token,
          uid: uid
        )
        # user = User.create!(
        #   name: name,
        #   email: auth_provider&.[](:credentials)&.[](:email),
        #   password: auth_provider&.[](:credentials)&.[](:password)
        # )
        # require 'pry'; binding.pry
        # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        # token = crypt.encrypt_and_sign("user-id:#{ user.id }")
        # context[:session][:token] = token
        # { user: user, token: token, errors: [] }
        {user: user, errors: []}
      end
      # def resolve(name:, email:, password_digest:)
      #   user = User.new(name: name, email: email, password_digest: password_digest)
      #   if user.save 
      #     { user: user, errors: []}
      #   else 
      #     {
      #       user: nil, 
      #       errors: user.errors.full_messages
      #     }       
      #   end
      # end


    end

end
