pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./Main.sol";


contract SpecialOfficer is Main {
    
    address walletAddress;
    string email;
    string phoneNumber;
    string name;
    string employeeId; 

    constructor (address _walletAddress, string memory _email, string memory _phoneNumber, 
    string memory _name, string memory _employeeId) public {
        walletAddress = _walletAddress;
        email = _email;
        phoneNumber = _phoneNumber;
        name = _name;
        employeeId = _employeeId;
    }

    function login(address userAddress, string memory role) public  returns (string memory) {
    }

    function logout() public returns (bool) {

    }
}