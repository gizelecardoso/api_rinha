module Pessoas
  class Count < Actor
    output :count

    def call
      self.count = Pessoa.count
    end
  end
end
