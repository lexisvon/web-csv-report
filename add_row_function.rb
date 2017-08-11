def add_row_function 
  
  name = params["account"]
  date = params["date"]
  payee = params["payee"]
  category = params["category"]
  inflow = params["inflow"]
  outflow = params["outflow"]

  open('temp.txt', 'a') { |file|
    str = ""
    str << name + ","
    str << date + ","
    str << payee + ","
    str << category + ","
    str << inflow + ","
    str << outflow + "\n"

    file << str
  }

end