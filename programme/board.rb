class Board
  attr_accessor :boardcases
  def initialize
    # Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    # Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @boardcases = []
    for i in (1..9)
      @boardcases << BoardCase.new(i.to_s)
    end
    print_board
  end

  def print_board
    barre = '|'.green
    x = ' ' * 3
    y = ' ' * 14 + barre + ' ' * 7 + barre
    z = ' ' * 6 + '_'.green * 26

    puts
    puts y
    puts ' ' * 10 + @boardcases[0].value + x + barre + x + @boardcases[1].value + x + barre + x + @boardcases[2].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcases[3].value + x + barre + x + @boardcases[4].value + x + barre + x + @boardcases[5].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcases[6].value + x + barre + x + @boardcases[7].value + x + barre + x + @boardcases[8].value
    puts y
    puts
    puts
  end


  def play(choice, result)
     # Change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    @boardcases[choice - 1].value = result
  end

  def already_played?(choice)
    if @boardcases[choice - 1].value == 'X'.blue.bold || @boardcases[choice - 1].value == 'O'.red.bold
      true
    else
      false
    end
  end

  def victory?
    # Qui gagne ?
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    victory = 0
    win_combos.each do |combo|
      if @boardcases[combo[0]].value == 'X'.blue.bold && @boardcases[combo[1]].value == 'X'.blue.bold && @boardcases[combo[2]].value == 'X'.blue.bold
        victory = 1
      elsif @boardcases[combo[0]].value == 'O'.red.bold && @boardcases[combo[1]].value == 'O'.red.bold && @boardcases[combo[2]].value == 'O'.red.bold
        victory = 2
      end
    end
    victory
  end
end
