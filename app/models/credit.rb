class Credit < ActiveRecord::Base

  def get_credit_payments
    credit_payments = CreditPayment.where(credit_id: self.id)

    puts json: credit_payments
    payments_ids = Array.new
    credit_payments.each{|credit_payment| payments_ids.push(credit_payment.payment_type_id)}

    payments = CreditPaymentType.where(id: payments_ids)

    payments

  end

  def get_credit_warrenties
    credit_warrenties = CreditWarrenty.where(credit_id: self.id)

    puts json: credit_warrenties
    warrenty_ids = Array.new
    credit_warrenties.each{|credit_warrenty| warrenty_ids.push(credit_warrenty.warrenty_type_id)}

    puts json: warrenty_ids
    warrenties = CreditWarrantyType.where(id: warrenty_ids)

    warrenties

  end

  def get_credit_grantings
    credit_grantings = CreditGranting.where(credit_id: self.id)

    puts json: credit_grantings
    grantings_ids = Array.new
    credit_grantings.each{|credit_granting| grantings_ids.push(credit_granting.granting_type_id)}

    grantings = CreditGrantingType.where(id: grantings_ids)

    grantings

  end
end