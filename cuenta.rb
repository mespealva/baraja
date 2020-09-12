class Usuario
  def initialize(nombre, cuentas_bancarias)
    @nombre = nombre
    @cuentas_bancarias = cuentas_bancarias
  end

  def saldo_total
    return @cuentas_bancarias.inject(0){|sum,cuenta| sum + cuenta.saldo}
  end
end

class CuentaBancaria
  attr_accessor :saldo
  def initialize(banco, numero_de_cuenta, saldo = 0)
    @banco = banco
    @numero_de_cuenta = numero_de_cuenta
    @saldo = saldo
  end

  def transferir(monto, cuenta_destino)
    @saldo -= monto
    cuenta_destino.saldo += monto
  end
end

c = CuentaBancaria.new('Banco de Chile','22334455',50000)
c2 = CuentaBancaria.new('BCI','11223344',2000)

c.transferir(5000,c2)

c3 = CuentaBancaria.new('Santander','12345678',1000)
c4 = CuentaBancaria.new('Banco Estado', '8765321',2000)
cuentas = [c, c2, c3, c4]
p1 = Usuario.new('Pepa',cuentas)

puts p1.saldo_total