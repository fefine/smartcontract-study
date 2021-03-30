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
    const TokenV2 = await ethers.getContractFactory("TokenV2");
    const token = await TokenV2.deploy();
    console.log("Token address", token.address);

    // 等待一段时间, 然后验证contract
    let wait = await token.mint(deployer.address, '1000000000000000000000');
    console.log(wait);
    wait = await token.mint(deployer.address, '2000000000000000000000');
    console.log(wait);
    wait = await token.mint(deployer.address, '3000000000000000000000');
    console.log(wait);

    await hre.run("verify:verify", {
        address: token.address,
        constructorArguments: [],
    });
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });