class House 
  class << self

    def recite
      poem = []
      piece = []
      idx = pieces.size - 1

      while idx >= 0
        piece << 'This is'
        pieces.drop(idx).each do |chnk|
          chnk.each do |part|
            if piece.include?('This is')
              piece << part
              poem << piece.join(' ')
              piece = []
              next
            end
            if piece.size == 2
              poem << piece.join(' ')
              poem << '\n'
              piece = []
            end
            piece << part
          end
          
        end
        piece = []
        idx -= 1
      end
      poem
    end

    private

    def pieces
      [
        ['the horse and the hound and the horn', 'that belonged to'],
        ['the farmer sowing his corn', 'that kept'],
        ['the rooster that crowed in the morn', 'that woke'],
        ['the priest all shaven and shorn', 'that married'],
        ['the man all tattered and torn', 'that kissed'],
        ['the maiden all forlorn', 'that milked'],
        ['the cow with the crumpled horn', 'that tossed'],
        ['the dog', 'that worried'],
        ['the cat', 'that killed'],
        ['the rat', 'that ate'],
        ['the malt', 'that lay in'],
        ['the house that Jack built']
      ]
    end
  end
end

p House.recite