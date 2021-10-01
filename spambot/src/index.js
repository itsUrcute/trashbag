const {
	    Client
} = require("discord.js");
const { readFileSync } = require("fs");

const tokens = readFileSync("./tokens.txt", { encoding: "utf8" }).match(/[\w-\.]+/g);
console.log(tokens);

const ad = `advertisement`;
const timeout = 1000;

const clients = [];
for (let token of tokens) {
	    const client = new Client();
	    client.login(token).then(() => {
		        console.log(client.user.tag, "logged in successfully");
		    }).catch(console.log);
		        client.on("ready", () => {
					            setTimeout(() => {
								                const users = client.users.cache;
								                console.log(`${client.user.tag} has ${users.size} users in cache`);
								                for (const [_, user] of users) {
													                    user.send(ad).then(console.log("Sent an ad to", user.tag)).catch(() => {});
													                }
								            }, timeout)
					        });
}
