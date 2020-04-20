class ContaCorrente
    attr_accessor :saldo, :mensagem

    def initialize(saldo)
       self.saldo = saldo 
    end

    def saca(valor)
        if (valor > self.saldo)
            self.mensagem = 'Saldo insuficiente para saque'
        elsif (valor > 700.00)
            self.mensagem = 'Limite máximo por saque é de R$700'

        else    
            self.saldo -= valor
        end
        
    end

end

describe ContaCorrente do
    
    describe 'saque' do 
        context 'Quando o saldo está positivo' do 
           before(:all) do
                @conta = ContaCorrente.new(1000.00)
                @conta.saca(200.00)
            end
            it 'O saldo é atualizado' do
                expect(@conta.saldo).to eql 800.00
            end
        end
        
        context 'Quando o saldo é zero' do
            before(:all) do
                @conta = ContaCorrente.new(0.00)
                @conta.saca(120.00)
            end 
            it 'Apresenta a mensagem' do 
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque'
            end
            it 'Meu saldo permanece com o valor inicial' do
                expect(@conta.saldo).to eql 0.00
            end


        end

    end
end
