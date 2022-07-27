// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract IpfsVersionControl {

    //mapping (string => string) private userFiles;

    struct UserFile{
        string fileName;
        string fileHash;
        uint256 lastModified;
    }

    mapping (address => mapping(string => mapping( string => UserFile))) private userDirectory;

    event FileUpload(address indexed _user, string indexed _fileName, string _fileVersion, uint256 indexed timestamp);

    function getFile(string memory _fileName, string memory _fileVersion) external view returns (UserFile memory) {
        
        bytes memory fileNameBin = bytes(_fileName);
        bytes memory fileVersionBin = bytes(_fileVersion);

        require(fileNameBin.length>0, "File name is empty");
        require(fileVersionBin.length>0, "File version is empty");

        /*
        string memory fileVersion = _fileVersion;

        if (fileVersionBin.length == 0) {
            fileVersion = "latest";
        }
        */
        
        return userDirectory[msg.sender][_fileName][_fileVersion];
    }

    function setFile(string memory _fileName, string memory _fileVersion, string memory _fileHash) external {
        
        bytes memory fileNameBin = bytes(_fileName);
        bytes memory fileVersionBin = bytes(_fileHash);
        bytes memory fileHashBin = bytes(_fileHash);

        require(fileNameBin.length>0, "File name is empty");
        require(fileHashBin.length>0, "File hash is empty");
        require(fileVersionBin.length>0, "File version is empty");

        /*
        string memory fileVersion = _fileVersion;

        if (fileVersionBin.length == 0) {
            fileVersion = "latest";
        }
        */
        
        UserFile memory userFile = UserFile(_fileName, _fileHash, block.timestamp); 
        userDirectory[msg.sender][_fileName][_fileVersion] = userFile;

        emit FileUpload(msg.sender, _fileName, _fileName, block.timestamp);
    }
}