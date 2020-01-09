pragma solidity ^0.5.11;

import "./Contractor.sol";

contract FactoryContractor {
    address[] allContractors;

    constructor () public {

    }
    
    //----do not use---- adds the new contract to same byte code--useless shit.
    function registerNewContractor(address _walletAddress, string memory _email, string memory _name,
    string memory _phoneNumber, string memory _panNumber, string memory _gstNumber) public returns (address) {
        Contractor contractor = new Contractor();
        contractor.setContractor(_walletAddress, _email, _name,
        _phoneNumber, _panNumber, _gstNumber);
        allContractors.push(address(contractor));
        return address(contractor);
    }
}