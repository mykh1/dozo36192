class OrderMailer < ApplicationMailer

  def order
    @itam = params[:item]
    mail to: @item.user.email, subject: 'ご登録品にご注文が入りました。【自動配信メール】'
  end


end
