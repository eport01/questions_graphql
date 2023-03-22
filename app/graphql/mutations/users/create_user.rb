module Mutations
  module Users 
    class CreateUser < Mutations::BaseMutation

      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end

      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: false
      # argument :email, String, required: true 
      type Types::UserType

      # field :user, Types::UserType, null:false 
      # field :errors, [String], null: false 
      def resolve(name: nil, auth_provider: nil)
        User.create!(
          name: name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
        )
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
end
