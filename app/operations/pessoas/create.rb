module Pessoas
  class Create < Actor
    input :attributes
    output :person

    def call
      self.person = Pessoa.create!(attributes)
    end
  end
end
