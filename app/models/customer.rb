class Customer < ApplicationRecord

    validates :name, :username, :password, presence: true
    validates :username, uniqueness: true

    validates :name, format: {
        with: /\A[a-zA-Z]+\z/,
        message: "should have letters only (a-z, A-Z)"
    }
    #validations checks to values with condintionals...example is there a value(3)? or are they only letters(line 7)?
    # if its false it will set the error messages....which can be retrieved by .errors.full_messages store this in flash[:errors]

    # validates :age, numercality: {
    #     greater_than: 18
    # }
    #custom validates method is singular validate

    has_secure_password

    # def password=(plaintext_password)
    #     #run plaintext_password through hashing algorithm
    #     encrypted_pw = BCrypt::Password.create(plaintext_password)

    #     #save the encrypted password to the database
    #     #password_digest is a attribute of customer class
    #     self.password_digest = encrypted_pw
    # end

    # def authenticate(plaintext_password)
    #     # pull out the password_digest string out of the database
    #         #encrypted_pw = self.password_digest
        
    #     #and turn it into an isntance Bycrypt::password
    #     encrypted_pw = BCrypt::Password.new(self.password_digest)

    #     #compare the encrypted passsword to the plaintext_password
    #     #and returns true if match else false
    #     encrypted_pw == plaintext_password
    # end
end
