const weather = require('weather-js')
const readline = require('readline')

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

rl.question('Please enter name of your city : ', (city) => {
    rl.question('Please enter the format of temperature[C/F] : ', (format) => {
        weather.find({search: city, degreeType: format}, function(err, result) {
            if(err) console.log(err)
            console.log("The temperature at your location is "+result[0]['current']['temperature']+`°${format}.`)
        })
        rl.close()
    })
})

