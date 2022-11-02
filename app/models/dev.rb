class Dev < ActiveRecord::Base
    belongs_to :company
    has_many :freebies
    has_many :companies, through: :freebies

    def freebies
        Freebie.where(dev_id: self.id)
    end

    def companies
        self.freebies.map do |freebie|
            freebie.company
        end
    end

    def received_one?(item_name)
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(dev,freebie)
        if self.id == freebie.dev_id
            freebie.update(dev_id: dev.id)
        end
       
    end

end
