pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./GovernmentOfficer.sol";


contract FactoryGovernmentOfficer {
    address[] allOfficers;

    constructor () public{
    }

    function registerOfficer(address _walletAddress, string memory _email, string memory _name, 
    string memory _phoneNumber, string memory _employeeId) public returns (address) {
        GovernmentOfficer newOfficer = new GovernmentOfficer();
        newOfficer.setGovernmentOfficer(_walletAddress, _email, _name, 
        _phoneNumber, _employeeId);
        allOfficers.push(address(newOfficer));
        return address(newOfficer);
    }

    // function returnString() public returns (string) {
    //     return "HelloWorld";
    // }

    // function returnInt() public returns (uint) {
    //     return 10;
    // }
}