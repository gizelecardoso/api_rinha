module Pessoas
  class Filter < Actor
    input :condition
    output :people

    def call
      self.people = Pessoa.where(
        "nome LIKE '%#{condition}%' OR \
        apelido LIKE '%#{condition}%' OR \
        '%#{condition}%' LIKE ANY(stack)"
      ).first(50)
    end
  end
end
