class Card
  attr_reader :value, :suit, :type

  def initialize(value, suit)
    @value = value
    @suit = suit
    @type = type_of
  end

  def type_of
    if (2..10).include?(@value.to_i)
      @type = 'number'
    elsif 'JQK'.include?(@value)
      @type = 'face'
    else
      @type = 'ace'
    end
    return @type
  end

  def name
    "#{value}#{suit}"
  end
end
