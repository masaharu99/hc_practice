class Pokemon
  private attr_reader :name
  private attr_reader :type1
  private attr_reader :type2
  private attr_reader :hp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @tyep2 = type2
    @hp = hp
  end

  def attack
    raise NotImplementedError, 'Subclasses must implement attack'
  end

  def change_name(new_name)
    if (new_name == 'うんこ')
      p '不適切な名前です'
      return
    end
    @name = new_name
  end
end
