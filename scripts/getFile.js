const hre = require("hardhat");

async function main() {
    const contractAddress = "0x7425effac2538354e4aF187b514A6c4B12dc472f";
    const ipfsContract = await hre.ethers.getContractAt("IpfsVersionControl", contractAddress);
    
    let fileData = await ipfsContract.getFile("file1", "latest");
    console.log("file data:", fileData);

    fileData = await ipfsContract.getFile("file1", "0.1");
    console.log("file data:", fileData);

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

