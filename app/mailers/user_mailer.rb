class UserMailer < ApplicationMailer
  def loan_created_email(book_loan)
    @title = book_loan.book.title
    @date = book_loan.created_at
    @due_date = book_loan.due_date
    @email = book_loan.user.email
    @email_subject = "New action in your account"
    mail(to: @email, subject: @email_subject)
  end

  def due_date_notification_email
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    @email = book_loan.user.email
    @email_subject = "ALERT"
    mail(to: @email, subject: @email_subject)
  end
end
