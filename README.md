# IPFS Version Control

This project demonstrates a simple file storage and versioning using Solidity and IPFS.

### Deploy:

```shell
npm init
npx hardhat node
npx hardhat run scripts/deploy.js
```

### Test:

`npx hardhat test`


### Endpoints:

```setFile
    Arguments: 
        _fileName : string
        _fileVersion : string
        _fileHash : string
```

Set File On Chain with Mandatory Inputs such as fileName, fileVersion (0.1, latest etc), and fileHash (ipfsHash)

```getFile
    Arguments: 
        _fileName : string
        _fileVersion : string
```

Returns File Details such as fileName, fileHash, and lastModified, as a tuple.


### Note:

There is no check which ensures that fileHash is resolved or not, at this point of time.