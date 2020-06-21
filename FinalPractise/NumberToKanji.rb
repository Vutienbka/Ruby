require 'test/unit'
class NumberToString
  def to_Kansuji number
    unit = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九"]
    m_num = {:juu => "十", :hyaku => "百", :sen => "千", :man => "万", :ooku => "億", :chou => "兆", :kei => "京", :gai => "垓", :jo => "𥝱", :joo => "穣", :koo => "溝",
             :kan => "澗", :sei => "正", :sai => "載", :goku => "極", :googasha => "恒河沙", :asoogi => "阿僧祇", :nayuta => "那由他", :fukashigi => "不可思議", :muryootaisuu => "無量大数"}
    if number > 0
      if number < 20
        return unit[number]
      elsif number < 100
        return to_Kansuji(number / 10) + m_num[:juu] + to_Kansuji(number % 10)
      elsif number < 200
        return m_num[:hyaku] + to_Kansuji(number % 100)
      elsif number < 1000
        return to_Kansuji(number / 100) + m_num[:hyaku] + to_Kansuji(number % 100)
      elsif number < 2000
        return m_num[:sen] + to_Kansuji(number % 1000)
      elsif number < 10**4
        return to_Kansuji(number / 1000) + m_num[:sen] + to_Kansuji(number % 1000)
      elsif number < 10**8
        return to_Kansuji(number / 10**4) + m_num[:man] + to_Kansuji(number % 10**4)
      elsif number < 10**12
        return to_Kansuji(number / 10**8) + m_num[:ooku] + to_Kansuji(number % 10**8)
      elsif number < 10**16
        return to_Kansuji(number / 10**12) + m_num[:chou] + to_Kansuji(number % 10**12)
      elsif number < 10**20
        return to_Kansuji(number / 10**16) + m_num[:kei] + to_Kansuji(number % 10**16)
      elsif number < 10**24
        return to_Kansuji(number / 10**20) + m_num[:gai] + to_Kansuji(number % 10**20)
      elsif number < 10**28
        return to_Kansuji(number / 10**24) + m_num[:jo] + to_Kansuji(number % 10**24)
      elsif number < 10**32
        return to_Kansuji(number / 10**28) + m_num[:joo] + to_Kansuji(number % 10**28)
      elsif number < 10**36
        return to_Kansuji(number / 10**32) + m_num[:koo] + to_Kansuji(number % 10**32)
      elsif number < 10**40
        return to_Kansuji(number / 10**36) + m_num[:kan] + to_Kansuji(number % 10**36)
      elsif number < 10**44
        return to_Kansuji(number / 10**40) + m_num[:sei] + to_Kansuji(number % 10**40)
      elsif number < 10**48
        return to_Kansuji(number / 10**44) + m_num[:sai] + to_Kansuji(number % 10**44)
      elsif number < 10**52
        return to_Kansuji(number / 10**48) + m_num[:goku] + to_Kansuji(number % 10**48)
      elsif number < 10**56
        return to_Kansuji(number / 10**52) + m_num[:googasha] + to_Kansuji(number % 10**52)
      elsif number < 10**60
        return to_Kansuji(number / 10**56) + m_num[:asoogi] + to_Kansuji(number % 10**56)
      elsif number < 10**64
        return to_Kansuji(number / 10**60) + m_num[:nayuta] + to_Kansuji(number % 10**60)
      elsif number < 10**68
        return to_Kansuji(number / 10**64) + m_num[:fukashigi] + to_Kansuji(number % 10**64)
      elsif number < 10**88
        return to_Kansuji(number / 10**68) + m_num[:muryootaisuu] + to_Kansuji(number % 10**68)
      else
        return m_num[:muryootaisuu]
      end
      else return ""
    end
  end
end

test = NumberToString.new
puts test.to_Kansuji 30

