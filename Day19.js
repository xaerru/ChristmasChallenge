// Day 19
// A wonderful world! 

// Challenge:
// Write a program that outputs a different Christmas tradition from around the world each time it is run. 
// You can use web scraping, the google API or whatever you want, really!

const cheerio = require('cheerio')
const request = require('request')

request({
    method: 'GET',
    url: 'https://www.momondo.com/discover/christmas-traditions-around-the-world'
}, (err, res, body) => {

    if (err) return console.error(err)

    let $ = cheerio.load(body)
    let gifts = []
    $('h2').each(function (i, e) {
        gifts[i] = $(this).text()
    })
    console.log("Different Christmas traditions around the world are: ")
    gifts.forEach(function (gift, index) {
        console.log(index+1,":",gift)
    })
})


