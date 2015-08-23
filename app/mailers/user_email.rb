class UserEmail < ActionMailer::Base

    default to: ["karol.frackowiak@3d-efekt.pl", "mikolaj.mirski@3d-efekt.pl"]
	
    def welcome_email(name, surname, email, body)
        @name = name
        @surname = surname   
        @email = email
        @body = body

        mail(from: email, subject: 'Zapytanie ze strony 3d-efekt.pl') 
    end
end