class OrderMailer < ApplicationMailer

  def order
    @order = params[:order]
    mail to: @order.item.user.email, subject: 'ご登録品にご注文が入りました。【自動配信メール】'
  end


end
