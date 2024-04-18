var rules={ "and" : [
    {">" : [ { "var" : "amount" }, 0]},
    {">" : [ { "var" : "created_at" }, "2021-01-01"]},
    {"or":[
    {"==":[ {"var":"shipping_country"},"Italy"]},
    {"==":[ {"var":"shipping_country"},"Croatia"]}
  ]}
  ] };
