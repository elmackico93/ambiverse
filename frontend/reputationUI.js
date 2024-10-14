// Web3 initialization
const Web3 = require('web3');
const web3 = new Web3(Web3.givenProvider || "http://localhost:8545");

// ABI and contract address
const contractABI = [...] // Inserisci l'ABI del contratto qui
const contractAddress = '0x123...'; // Inserisci l'indirizzo del contratto

const reputationContract = new web3.eth.Contract(contractABI, contractAddress);

// Function to increase reputation
async function increaseReputation(userAddress, type, amount) {
    const accounts = await web3.eth.getAccounts();
    await reputationContract.methods.increaseReputation(userAddress, type, amount).send({ from: accounts[0] });
}

// Function to get reputation
async function getReputation(userAddress) {
    const reputation = await reputationContract.methods.getReputation(userAddress).call();
    console.log("Creativity:", reputation.creativity);
    console.log("Technology:", reputation.technology);
}
