const readline = require('readline');
const fs = require('fs');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let parser = (text, text1) => {
    let len = 19;
    let textLen = text.length;
    let final_text = "|" + text.padStart(len / 2 + textLen / 2).padEnd(len) + "|" + text1.padStart(len / 2 + textLen / 2).padEnd(len) + "|";
    return final_text;
}

let drawCard = (s) => {
    let a = `
 ___________________
/                   |
|   MERRY           |
|       CHRISTMAS   |
|                   |
|       \\ ! /       |
|     -- (*) --     |
|        .#.        |
|       .###.       |
|      .#%##%.      |
|     .%##%###.     |
|    .##%###%##.    |
|   .#%###%##%##.   |
|         #         |
|         #         |
|___________________|
`;
    let b = `
 __________________   __________________
|                  \\ /                  |
|    From           |    To             |
|                   |                   |
|                   |                   |
${s}
|                   |                   |
|                   |                   |
|                   |                   |
|                   |                   |
|                   |                   |
|    --==*==--      |    --==*==--      |
|__________________ | __________________|
                   \\|/
`;
    let c = String.raw `
 __________________
|                  \
|     _\/  \/_      | 
|      _\/\/_       |
|  _\_\_\/\/_/_/_   |
|   / /_/\/\_\ \    |
|      _/\/\_       |
|      /\  /\       |
|                   |
|                   |
|    --==*==--      |
|                   |
|__________________ |
`;
    return a + b + c;
}

rl.question("Do you want save the card to a file or load it from a file? [S/L]", (choice) => {
    if (choice.toLowerCase() == "s") {
        rl.question("Do you want to save the card in a file or output it in the console? [File/Console]", (choice1) => {
            if (choice1.toLowerCase()[0] == "c") {
                rl.question("Enter your name: ", (sender) => {
                    rl.question("Enter the receiver's name: ", (receiver) => {
                        console.log(drawCard(parser(sender, receiver)));
                        rl.question("Press any key to exit", (s) => {
                            process.exit();
                        });
                    });
                });
            } else if (choice1.toLowerCase()[0] == "f") {
                rl.question("Enter your name: ", (sender) => {
                    rl.question("Enter the receiver's name: ", (receiver) => {
                        fs.writeFile('card.txt', drawCard(parser(sender, receiver)), (err) => {
                            if (err) throw err;
                            console.log("Card saved in card.txt");
                            rl.question("Press any key to exit", (s) => {
                                process.exit();
                            });
                        });
                    });
                });
            } else {
                console.log("Try again.");
                rl.question("Press any key to exit", (s) => {
                    process.exit();
                });
            }
        });
    } else if (choice.toLowerCase() == "l") {
        fs.readFile('card.txt', 'utf-8', (err, data) => {
            if (err) console.log("File not found");
            console.log(data);
            rl.question("Press any key to exit", (s) => {
                process.exit();
            });
        });
    }
});
