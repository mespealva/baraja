require_relative 'carta.rb'

class Baraja
  attr_reader :cartas
  def initialize
    @cartas = []
    ['C','D','E','T'].each do |pinta|
      13.times do |numero|
        num = numero + 1
        @cartas.push(Carta.new(num,pinta))
      end
    end
  end

  def barajar
    @cartas = @cartas.shuffle
  end

  def sacar
    carta = (@cartas).pop(1)
    return carta
  end

  def repartir_mano
    mano = []
    5.times do |i|
      mano.push(sacar)
    end
    return mano
  end
end

deck = Baraja.new
