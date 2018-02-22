#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
var readline = require('readline');

var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

filePath = path.resolve(process.cwd(), './Cards.json');

let cards = {};
fs.readFile(filePath, 'utf8', function (err, contents) {
    if (err){
       rl.write(`error opening file: ${filePath}`,err);
    }else{
        cards = JSON.parse(contents)
        startCards(cards)
    }
    
});

function startCards(cards){
    
    most = 0;
    questions = Object.keys(cards);
    seen = Array(questions.length)
    rl.write("FLASH CARDS")
    let input = ''
    //type loop
    while (input !== 'q'){
        rl.question('random(r) \nby topic(t) \nby unknown amount\n\n only r works for now', (answer)=>{
            console.log(answer);
            input = answer.toString().trim();
            let next = ''

            //cards loop
            while (next !== 'q') {

                rl.write()

            }
        })

    }
}
function getUnseen(seen,most,questions){
    let i = Math.random(questionArr.length)
    while (seen[i] <= most){
        i = Math.random(questionArr.length)
    }
    question = questionArr[i]
}
function writeFile(fcards){
    fs.writeFile(filePath, JSON.stringify(fcards), (err) => {
        if (err) console.log(err);
    })
}
