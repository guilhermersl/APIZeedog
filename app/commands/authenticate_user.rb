class AuthenticateUser
    prepend SimpleCommand
  
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_accessor :email, :password
  
    def user
      #Guilherme - Se usuário já cadastrado, autentica e gera o token JWT. Caso contrário, cria um novo usuário antes.
      user = User.find_by_email(email)
      unless user
        user = User.create(email: email,
                           password_digest: BCrypt::Password.create(password))
      end
      
      return user if user && user.authenticate(password)
        errors.add :user_authentication, 'credenciais inválidas'
        nil
    end
  end