class Company < ActiveRecord::Base
    has_many :freebies
    has_many :developers, through: :freebies

    def freebies
        Freebie.where(company_id: self.id)

    end

    def dev
       self.freebies.map do |freebie|
          freebie.dev
       end
    end

    def give_freebie(dev, item_name, value)
          Freebie.create(item_name: item_name, value: 15, company:self, dev: dev)
    end

    def self.oldest_company
        self.all.min_by do |company|
            company.founding_year
        end
    end



end
