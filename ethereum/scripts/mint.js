require("dotenv").config();
const { ethers } = require("ethers");

const contract = require("../artifacts/contracts/nft.sol/nft.json");
const contractInterface = contract.abi;

// https://docs.ethers.io/v5/api/providers
const provider = ethers.getDefaultProvider("kovan", {
  alchemy: process.env.DEV_API_URL,
});

// https://docs.ethers.io/v5/api/signer/#Wallet
const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

//https://docs.ethers.io/v5/api/contract/contract
const nft = new ethers.Contract(
  0xA6dC5EdA4bC3037BaE51e6aA6F916A08fea30E0c, //YOUR_NFT_ADDRESS
  contractInterface,
  wallet
);

const main = () => {
  nft
    .mint(process.env.PUBLIC_KEY)
    .then((transaction) => console.log(transaction))
    .catch((e) => console.log("something went wrong", e));
};

main();