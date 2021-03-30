const hre = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:",
        deployer.address
    );

    console.log("Account balance:", (await deployer.getBalance()).toString());
    const initializeData = Buffer.from('');

    // We get the contract to deploy
    const Token = await ethers.getContractFactory("Token");
    const TokenProxy = await ethers.getContractFactory("TokenProxy");
    const token = await Token.deploy();
    console.log("Token address", token.address);
    const res = await token.init("TEST", "TST");
    console.log(res);
    const owner = '0x80c214E4E86DcC168343DFe93201571c38bB32E6';
    const proxy = await TokenProxy.deploy(token.address, owner, initializeData);

    console.log("proxy deployed to:", proxy.address);

    await hre.run("verify:verify", {
        address: token.address,
        constructorArguments: [],
    })
    await hre.run("verify:verify", {
        address: proxy.address,
        contract: "contracts/TokenProxy.sol:TokenProxy",
        constructorArguments: [
            token.address,
            owner,
            initializeData
        ],
    })
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });