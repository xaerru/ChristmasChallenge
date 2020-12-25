// Day 2
// Crackers!

// Challenge:
// Write a program that plays christmas crackers with you - 
// that is a program that asks if you want to pull a cracker with it and if so outputs a random prize & joke (the jokes have to be good, or else...)

// Language -> Rust

use rand::seq::SliceRandom; 

fn main() {
    let gifts = vec!["a gin", "a hand cream", "chocolates", "cone-shaped Christmas crackers", "confetti crackers OwO!!", "musical kazoos OwO!!"];
    let jokes = vec!["I went to a street where the houses were numbered 8k, 16k, 32k, 64k, 128k, 256k and 512k.\nIt was a trip down Memory Lane.",
                     "If doctors were like software engineers, they would say things like “Have you tried killing yourself and being reborn?”",
                     "A programmer’s wife asks: “Would you go to the shop and pick up a loaf of bread? And if they have eggs, get a dozen.”
The programmer returns home with 12 loaves of bread.
“They had eggs.”","“Debugging” is like being the detective in a crime drama where you are also the murderer.","Programming is like sex. One mistake and you have to support it for the rest of your life.
"];
    let mut line = String::new();
    let gift = gifts.choose(&mut rand::thread_rng()).unwrap();
    let joke = jokes.choose(&mut rand::thread_rng()).unwrap();
    println!("Lets play Christmas Crackers.");
    println!("Do you want to pull the cracker?[Y/N]: ");
    std::io::stdin().read_line(&mut line).unwrap();
    if line.starts_with("Y"){
        println!("You pulled a cracker and got {}.",gift);
        println!("Here's the joke you got ->\n{}",joke);
    } else {
        println!("Next time!");
    }
}

