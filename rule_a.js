var rules={ "and" : [
    {">" : [ { "var" : "amount" }, 0]},
    {">" : [ { "var" : "created_at" }, "2021-01-01"]},
    {"or":[
    {"==":[ {"var":"shipping_country"},"Italy"]},
    {"==":[ {"var":"shipping_country"},"Croatia"]}
  ]}
  ] };

  var test_data={ "amount" : 0, "created_at" :"2022-10-01","shipping_country":"Italy"  }
