/module Pessoas
  class Find < Actor
    input :id
    output :person

    def call
      self.person = Pessoa.find(id)
    end
  end
end
