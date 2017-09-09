db.users.insert({"name": "Tom", "age": 28, languages: ["english", "spanish"]});

db.users.insert({"name": "Red", "age": 18, languages: ["english", "spanish"]});

db.order.insert({"type": "food", "price": 100, "city": "Moskov"});

db.order.find();

db.users.insert({"name": "Harry", "age": 38, languages: ["english"], "sex": "Men"});

db.users.insert({"name": "Harry", "age": 38, languages: ["english"], "sex": "Men"});

db.users.find({"age": 38, "name": "Harry"});

db.users.find({"age": {$gt: 27}});

db.users.insert({"name": "Arnold", "age": 25, languages: ["english"], "sex": "Men", "education": {"university": "MIT"}});

db.users.find({"education.university": "MIT"});

db.users.find({"age": {$ne: 28}});

db.users.find({"age": {$in: [28, 18]}});

db.users.find({education: {$sxists: true}});

db.users.find({
    $or: [
        {"age": {$in: [28, 18]}}, {"name": "Harry"}
    ]
});