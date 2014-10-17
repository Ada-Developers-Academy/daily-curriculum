module LectureStuff
  def bin_search_guess_iter(ar, num)
    low   = 0
    high  = ar.length
    mid   = ar.length / 2
    cnt   = 0

    until high - low < 2 or cnt > 100
      puts "high: #{high}, low: #{low}, mid: #{mid}"
      if num >= ar[mid]
        low = mid
        mid = (high - low) / 2 + mid
      else
        high = mid
        mid = (high - low) / 2 + low
      end
      cnt += 1
    end
    mid
  end

  def bin_search_guess(ar, num)
    return 0 if ar.length == 0
    mid = ar.length / 2

    puts "ar.length: #{ar.length}, ar.mid: #{ar[mid]} mid: #{mid}, num: #{num}"
    if ar[mid] == num
      mid
    elsif num < ar[mid]
      bin_search_guess(ar[0...mid], num)
    else
      mid + bin_search_guess(ar[mid + 1..ar.length], num)
    end
  end

  def is_in?(ar, n)
    puts "is_in? called with : #{ar} - #{n}"
    if ar.length == 0
      false
    elsif ar.length == 1
      ar[0] == n
    else
      sub_ar_1 = ar[0...1]
      sub_ar_2 = ar[1..-1]
      is_in?(sub_ar_1, n) or is_in?(sub_ar_2, n)
    end
  end

  def find_insert(ar, guess, num)
    if ar[guess] < num
      guess += 1 while ar[guess] < num
    else
      guess -= 1 while ar[guess] >= num
    end
    guess
  end
end
