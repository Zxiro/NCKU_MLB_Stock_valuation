library(finreportr)

b_c_stock<-c('AAPL', 
             'MSFT', 
             'AMZN', 
             'DIS', 
             'FB', 
             'BRK.A', 
             'V', 
             'JNJ', 
             'JPM', 
             'XOM', 
             'GOOG',
             'GM',
             'IBM',
             'MCD',
             'ORCL',
             'BA')



for(ele in b_c_stock){
  print(ele)
  for (j in c(2010:2019)){
    print(j)
    err_res<-tryCatch({
      gg<-GetBalanceSheet(ele, j)
      write.csv(gg, paste("BS", ele, j,".csv", sep = '_'))
    }, error = function(err){
      print('err_pass')
    }, finally = {
      print('next_act')
    })
    err_res<-tryCatch({
      gg<-GetCashFlow(ele, j)
      write.csv(gg, paste("CF", ele, j,".csv", sep = '_'))
    }, error = function(err){
      print('err_pass')
    }, finally = {
      print('next_act')
    })
    err_res<-tryCatch({
      gg<-GetIncome(ele, j)
      write.csv(gg, paste("IC", ele, j,".csv", sep = '_'))
    }, error = function(err){
      print('err_pass')
    }, finally = {
      print('next_yr')
    })
  }
  print(paste(ele, "finished"))
}

