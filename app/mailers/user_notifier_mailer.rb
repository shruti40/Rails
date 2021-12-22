class UserNotifierMailer < ApplicationMailer

    default :from => 'default@example.com'

    # send a signup email to the user, pass in the user object that contains the user's email address
    def send_shift_creation_email
        mail( :to => 'cr_dev@full-cycle.com',
        :subject => 'Thanks for signing up for our amazing app' )
    end

end
