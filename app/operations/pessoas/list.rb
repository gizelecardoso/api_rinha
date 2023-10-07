module Pessoas
  class List < Actor
    output :people

    def call
      self.people = Pessoa.select(:apelido, :nome, :nascimento, :stack).first(2)
    end
  end
end
