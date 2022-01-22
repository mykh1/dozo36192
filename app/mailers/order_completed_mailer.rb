class OrderCompletedMailer < ApplicationMailer
  def order_completed
    @order = params[:order]
    mail(to: @oredr.email, subject: '注文が完了しました')
  end
end
