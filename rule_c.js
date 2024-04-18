//The conditions are for sending mail to the manager based on the details of customer service tickets opened 
//the conditions are that the user belongs to project management, the issue category is payment, the ticket was created on the 18th of April 2024 and the priority is high,
//if two of these conditions are met the mail will be sent to the manager
var rules = {
  "or": [
    { "and": [{ "==": [{ "var": "department" }, "project management"] }, { "==": [{ "var": "issue_category" }, "payment"] }] },
    { "and": [{ "==": [{ "var": "department" }, "project management"] }, { "==": [{ "var": "created_at" }, "2024-04-18"] }] },
    { "and": [{ "==": [{ "var": "department" }, "project management"] }, { "==": [{ "var": "priority" }, "high"] }] },
    { "and": [{ "==": [{ "var": "issue_category" }, "payment"] }, { "==": [{ "var": "created_at" }, "2024-04-18"] }] },
    { "and": [{ "==": [{ "var": "issue_category" }, "payment"] }, { "==": [{ "var": "priority" }, "high"] }] },
    { "and": [{ "==": [{ "var": "created_at" }, "2024-04-18"] }, { "==": [{ "var": "priority" }, "high"] }] }
  ]
};

var test_data={ "department" : "project management", "issue_category" :"gui","created_at":"2024-04-18","priority":"low"  }
