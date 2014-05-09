module Spree
  class PaymentMethod::MolliePayment < PaymentMethod
    preference :api_key, :string

    def actions
      %w{void}
    end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def supports?(source)
      true
    end

    def source_required?
      false
    end
  end
end