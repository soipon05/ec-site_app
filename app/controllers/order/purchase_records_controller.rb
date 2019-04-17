class Order::PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  

  def new
    redierect_to root_path unless user_signed_in?
    
    @record = current_user.purchase_records.build
    @details = @purchase.set_attribute
  end
  
  
  def create
    @record = current_user.purchase_records.build
    # 必要な事項を全部突っ込んでDBにはまだ保存しない
    # assign_attirbute
    @record.assign_attribute(purchase_params)
    if @purchase.new_order
      redirect_to complete_order_purchase_record_path(@purchase)
    else
      render :new
    end
  end
  
  def complete
  end
  
  private
  
  def purchase_params
    params.require(:purchase_record).permit(
      :invoice_last_name, :invoice_first_name, :invoice_phone, :invoice_zip_code, :invoice_prefecture_id, :invoice_address1,:invoice_address2,
      :delivery_last_name, :delivery_first_name, :delivery_phone, :delivery_zip_code, :delivery_prefecture_id, :delivery_address1, :delivery_address2,
      details_attributes: [:product_id, :quantity]
      )
  end
end
