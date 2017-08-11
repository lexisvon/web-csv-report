def add_row_function 
  
  name = params["account"]
  date = params["date"]
  payee = params["payee"]
  category = params["category"]
  inflow = params["inflow"]
  outflow = params["outflow"]

  open('accounts.csv', 'a') { |file|
    str = ""
    str << "\n"
    str << name + ","
    str << date + ","
    str << payee + ","
    str << category + ","
    str << inflow + ","
    str << outflow

    file << str
  }

end