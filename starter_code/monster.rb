class Monster
  attr_accessor :threat_level, :habitat, :name

  @@count = 0

  @class_description = "A scary monster!"

  def self.count
    @@count
  end

  def self.class_description
    @class_description
  end

  def initialize(threat_level=:medium)
    @threat_level = threat_level
    puts "Rawr!"
    @@count = @@count + 1
    puts "#{@@count} monsters now roam the world!"
  end

  def habitat?(some_hab)
    @habitat == some_hab
  end

  def get_dangerous
    case @threat_level
      when :low
        @threat_level = :medium
      when :medium
        @threat_level = :high
      when :high
        @threat_level = :midnight
      when :midnight
        :midnight
    end
  end

  def self.fight(monster1, monster2)
    if monster1.threat_level == monster2.threat_level
      monster2
    elsif monster1.threat_level == :low
      monster2
    elsif monster1.threat_level == :medium
      if monster2.threat_level == :low
        monster1
      else
        monster2
      end
    else
      if monster2.threat_level == :midnight
        monster2
      else
        monster1
      end
    end
  end
end


class Zombie < Monster

  @class_description = "Shuffling, decaying flesh. Hungry and without remorse!"

  def initialize (threat_level=:medium)
    super(threat_level)
    @habitat = "graveyard"
  end
end

class Werewolf < Monster


  @class_description = "A man... a wolf... a monster!"

  def initialize (threat_level=:low)
    super(threat_level)
  end

  def update_threat_level(full_moon)
    if full_moon
      @threat_level = :midnight
    else
      @threat_level = :low
    end
    @threat_level
  end
end


module Flying
  def fly
    puts "#{self.name || "it"} soars through the air"
  end
end

class Vampire < Monster
  @class_description = "Dark and sparly."
  include Flying
end
