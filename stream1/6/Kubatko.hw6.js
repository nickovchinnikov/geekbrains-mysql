/**
 * Created by skubatko on 10/09/17.
 */

/**
 * Домашнее задание 6
 */

/**
 * Установить MongoDB и повторить запросы из методички
 */


// use employees

db.empDetails.insert({
    "firstName": "Angel",
    "lastName": "Brawn",
    "birthDate": "1978-11-21",
    "gender": "M",
    "languages": ["english", "spanish", "german"],
    "address": {
        "street": "ул. Ленина, д. 25, кв. 173",
        "city": "Uryupinsk",
        "country": "Russia",
        "postalCode": 128372
    },
    "monthSalary": 1200
});

db.empDetails.insert({
    "firstName": "Petr",
    "lastName": "Spirosov",
    "birthDate": "1983-03-17",
    "gender": "M",
    "languages": ["russian", "english"],
    "address": {
        "street": "ул. Ленина, д. 29, кв. 143",
        "city": "Uryupinsk",
        "country": "Russia",
        "postalCode": 128372
    },
    "monthSalary": 1800
});

db.empDetails.insert(
    {
        "firstName": "Ivan",
        "lastName": "Zitman",
        "birthDate": "1965-12-07",
        "gender": "M",
        "languages": ["russian", "spanish"],
        "address": {
            "street": "ул. Ленина, д. 17, кв. 43",
            "city": "Uryupinsk",
            "country": "Russia",
            "postalCode": 128372
        },
        "monthSalary": 3700
    })

db.empDetails.insert(
    {
        "firstName": "Alena",
        "lastName": "Fray",
        "birthDate": "1983-08-17",
        "gender": "F",
        "languages": ["russian", "german"],
        "address": {
            "street": "ул. Васюкова, д. 1, кв. 54",
            "city": "Nalchik",
            "country": "Russia",
            "postalCode": 137581
        },
        "monthSalary": 2300
    })

db.empDetails.insert(
    {
        "firstName": "Eugenya",
        "lastName": "Ivanova",
        "birthDate": "1985-07-21",
        "gender": "F",
        "languages": ["russian", "german"],
        "monthSalary": 1650
    })

db.empDetails.find().limit(3)

db.empDetails.find({languages: "german"})

db.empDetails.find({gender: "F"})

db.empDetails.find({"address.city": "Uryupinsk"})
db.empDetails.find({"address.city": "Nalchik"})
db.empDetails.find({"address.city": null})

db.empDetails.find({monthSalary: {$lte: 2000}})
db.empDetails.find({monthSalary: {$gt: 2000}})
db.empDetails.find({monthSalary: {$gt: 1500, $lt: 2000}})

db.empDetails.find({monthSalary: {$in: [1800, 2300]}})

db.empDetails.find({
    $or: [
        {monthSalary: {$lt: 1700}},
        {gender: "F"}
    ]
});

db.empDetails.find({"languages": {$size: 3}});
db.empDetails.find({languages: {$size: 3}});

db.empDetails.find({address: {$exists: false}});

db.empDetails.find({
    $and: [
        {address: {$exists: false}},
        {monthSalary: {$exists: true}}
    ]
});

db.empDetails.deleteMany({monthSalary: {$exists: false}})

db.empDetails.find({firstName: {$regex: /^E/}})
db.empDetails.find({firstName: {$regex: /e/}})

db.empDetails.updateOne({firstName: "Eugenya"}, {$set: {"monthSalary": 1700}})
db.empDetails.save({"_id": ObjectId("59b500d394b3ae71755ab791"), "monthSalary": 1650})
db.empDetails.save(
    {
        "_id": ObjectId("59b500d394b3ae71755ab791"),
        "firstName": "Eugenya",
        "lastName": "Ivanova",
        "birthDate": "1985-07-21",
        "gender": "F",
        "languages": ["russian", "german"],
        "monthSalary": 1650
    })
