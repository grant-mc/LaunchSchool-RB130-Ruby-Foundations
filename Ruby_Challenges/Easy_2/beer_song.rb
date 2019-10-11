#print line break in loop

class BeerSong

  def verse(num)
    case num
    when 2
      return "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      return "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      return "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      return "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(strt, stop)
    song = ""
    while strt >= stop
      song += verse(strt)
      song += "\n" if strt != stop
      strt -= 1
    end
    return song
  end

  def lyrics
    verses(99,0)
  end

end

# BeerSong.new.verses(99, 98)