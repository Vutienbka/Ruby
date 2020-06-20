def kanjiConvert(convert_num):
    # Converts kanji to arabic number

    if convert_num == "零":
        return 0

    # First, needs to check for MAN 万 and OKU 億 kanji, as need to handle differently, splitting up the numbers at these intervals.
    # key tells us whether we need to add or multiple the numbers, then we create a list of numbers in an order we need to multipy/add
    key = []
    numberList = []
    y = ""
    for x in convert_num:
      if x == "万" or x == "億":
          numberList.append(y)
      key.append("times")
      numberList.append(x)
      key.append("plus")
      y = ""
      else:
          y += x
      if y != "":
          numberList.append(y)

      numberListConverted = []
      baseNumber = ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
      linkNumber = ["十", "百", "千", "万", "億"]

      # Converts the kanji number list to arabic numbers, using the 'base number' and 'link number' list above. For a link number, we would need to
      # link with a base number
      for noX in numberList:
        count = len(noX)
        result = 0
        skip = 1
        for x in reversed(noX):
          addTo = 0
          skip -= 1
          count = count - 1
          if skip == 1:
              continue
          if x in baseNumber:
              for y, z in kanji_dict.items():
                if z == x:
                    result += int(y)
                elif x in linkNumber:
                    if noX[count - 1] in baseNumber and count > 0:
                        for y, z in kanji_dict.items():
                          if z == noX[count - 1]:
                              tempNo = int(y)
                          for y, z in kanji_dict.items():
                            if z == x:
                                addTo += tempNo * int(y)
                            result += addTo
                            skip = 2
                            else:
                                for y, z in kanji_dict.items():
                                  if z == x:
                                      result += int(y)
                                  numberListConverted.append(int(result))

                                  result = numberListConverted[0]
                                  y = 0

                                  # iterate over the converted list, and either multiply/add as instructed in key list
                                  for x in range(1,len(numberListConverted)):
                                    if key[y] == "plus":
                                        try:
                                        if key[y+1] == "times":
                                            result = result + numberListConverted[x] * numberListConverted[x+1]
                                        y += 1
                                        else:
                                            result += numberListConverted[x]
                                        except IndexError:
                                                   result += numberListConverted[-1]
                                        break
                                        else:
                                            result = result * numberListConverted[x]
                                        y += 1

                                        return result
