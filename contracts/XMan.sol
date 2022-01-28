// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./TomToken.sol";

contract XMan is TomToken {

    uint256 digDNA = 16;
    uint XManTokenCost = 100;
    uint modDNA = 10 ** digDNA;

    address private owner;
    event NewXMan(string name, uint dna);
    event OwnerSet (address indexed oldOwner, address indexed newOwner);

    struct xManStr {
        string name;
        uint dna;
    }

    xManStr[] public xmen;

    mapping (address => uint) ownerXManCount;
    mapping (address => xManStr[]) public xMenToOwner;

    constructor() {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }

    modifier IsOwner() {
        require(msg.sender == owner, "Owner Unknown");
        _;
    }

    function GetOwner() external view returns (address) {
        return owner;
    }

    function SetOwner(address newOwner) public IsOwner {
        owner = newOwner;
        emit OwnerSet(owner, newOwner);
    }

    function CreateXMan(string memory name, uint dna) internal {
        xManStr[] storage xMenOwner = xMenToOwner[msg.sender];
        xMenOwner.push(xManStr(name, dna));
        emit NewXMan(name, dna);
    }

    function ReturnXMan(uint index) external view returns (string memory, uint) {
        xManStr[] storage xMenOwner = xMenToOwner[msg.sender];
        xManStr memory xMan = xMenOwner[index];
        return (xMan.name ,xMan.dna);
    }

    function GetXManCount() external view returns (uint) {
        xManStr[] storage xMenOwner = xMenToOwner[msg.sender];
        return xMenOwner.length;
    }

    function CreateRandomXMan(string memory name, uint amount) public payable{
        require(amount >= XManTokenCost, "100 Tokens Required");

        transfer(owner, amount);

        uint randomDNA = GenerateRandomDNA(name);
        CreateXMan(name, randomDNA);
    }

    function GenerateRandomDNA(string memory _str) private view returns (uint) {
        uint random = uint(keccak256(abi.encodePacked(_str)));
        return random % modDNA;
    }
}