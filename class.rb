

class conta
    attr_accessor :saldo

    def deposita(valor)
        self.saldo += valor
        puts "depositando a quantia de #{valor} reais."
    end
end

c = conta.new

c.saldo = 0.0
c.deposita(100.00)
puts c.saldo
