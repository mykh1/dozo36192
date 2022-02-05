class OrderCompletedMailer < ApplicationMailer
  def order_completed
    @order = params[:order]
    mail to: @order.user.email, subject: '注文内容ご確認【自動配信メール】'
  end
end
