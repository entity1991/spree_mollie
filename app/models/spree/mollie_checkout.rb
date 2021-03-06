module Spree
  class MollieCheckout < ActiveRecord::Base
    has_many :payments, :as => :source

    def actions
      %w{capture void credit}
    end

    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    def can_void?(payment)
      payment.state != 'void'
    end

    def can_credit?(payment)
      payment.completed? && payment.credit_allowed > 0
    end

  end
end
