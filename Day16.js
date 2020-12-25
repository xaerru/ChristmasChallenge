// Day 16
// What should I get?

// Challenge:
// Write a program that uses web scraping to get the 10 most popular presents, and print them.

const cheerio = require('cheerio')
const request = require('request')

request({
    method: 'GET',
    url: 'https://www.goodhousekeeping.com/holidays/gift-ideas/g34330062/amazon-christmas-gifts/'
}, (err, res, body) => {

    if (err) return console.error(err)

    let $ = cheerio.load(body)
    let gifts = []
    $('.listicle-slide-hed-text').each(function (i, e) {
        gifts[i] = $(this).text()
    })
    console.log("Top 10 Christmas Presents are: ")
    gifts.forEach(function (gift, index) {
        if(index>=10)return
        console.log(index+1,":",gift)
    })
})

