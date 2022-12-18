class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    # def total_charge
    #     self.memberships.sum(:charge)
    # end

end
