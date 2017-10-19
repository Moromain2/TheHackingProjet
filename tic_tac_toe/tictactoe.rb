#Réalisation à 3 : Antoine, Albert et Romain

class Case
  attr_accessor :valeur
  def initialize(row, column)
    @valeur = ""
  end

end

class Tableau

  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  def initialize
    @a1 = Case.new(1,1)
    @a2 = Case.new(1,2)
    @a3 = Case.new(1,3)
    @b1 = Case.new(2,1)
    @b2 = Case.new(2,2)
    @b3 = Case.new(2,3)
    @c1 = Case.new(3,1)
    @c2 = Case.new(3,2)
    @c3 = Case.new(3,3)
  end

  def grille
    puts "1 : |#{@a1.valeur}, #{@a2.valeur}, #{@a3.valeur}|"
    puts "2 : |#{@b1.valeur}, #{@b2.valeur}, #{@b3.valeur}|"
    puts "3 : |#{@c1.valeur}, #{@c2.valeur}, #{@c3.valeur}|"
  end

  def case_chose(row, column)
    eval("@case#{row}#{column}.valeur = sign")
  end

end
Tableau.new.grille

class Joueur

  attr_accessor :name, :sign

  def initialize
    print "Hello, what's your name ?"
    player_name = gets.chomp
    @name = player_name
    @sign = ""
  end

  def move
    puts "#{name}, chose your move !"
    puts "Select your row (1 to 3 viva algerie)"
    row = gets.chomp.to_i
    puts "Select your column (1 to 3)"
    column = gets.chomp.to_i
    return [row, column]
  end

  def sign(signs)
    @sign = signs
  end

end
Joueur.new.move

class Game

  attr_accessor :tableau, :player1, :player2

  def initialize

    @tableau = Tableau.new


    print "Player 1"
    @player1 = Joueur.new
    player1.sign("X")
    print "Player 2"
    @player2 = Joueur.new
    player2.sign("O")
  end

  def launch
    tableau.grille
    choice = player1.sign

    tableau.case_chose(choice[0], choice[1], player1.symbol)

    tableau.grille
    choice = player2.sign

    tableau.case_chose(choice[0], choice[1], player2.symbol)
  end

end
tic_tac_toe = Game.new
