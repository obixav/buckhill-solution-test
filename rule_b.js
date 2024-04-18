var rules={ "and" : [
    {"==" : [ { "var" : "delivery_fee" }, 0]},
    {"==" : [ { "var" : "order_status.title" }, "shipped"]},
    {"or":[
    {"==":[ {"var":"payment.type"},"bank_transfer"]},
    {"==":[ {"var":"payment.type"},"credit_card"]}
  ]}
  ] };

  