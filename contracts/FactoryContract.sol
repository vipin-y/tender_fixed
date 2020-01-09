pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./Contract.sol";


contract FactoryContract {
    address[] allContracts;

    constructor () public {
    }

    function createContract(address govtOfficerAddress,
        address _contractorAddress, string memory _contractName, string memory _tenderId, 
        uint _completionTime, 
        string[] memory _constraints, 
        uint _finalQuotationAmount,
        string[] memory _taskDescription, 
        uint[] memory _deadlineForEachTask, 
        uint[] memory _amountForEachTask, 
        uint _reviewtime) public payable returns (address) {
        
        Contract newContract = new Contract();
        
        newContract.setContractBasic(govtOfficerAddress, 
        _contractorAddress, 
        _tenderId,
        _completionTime,
        _constraints
        );

        newContract.setContractAdvanced(_contractName, 
        _finalQuotationAmount,
        _taskDescription, 
        _deadlineForEachTask, 
        _amountForEachTask, 
        _reviewtime);

        allContracts.push(address(newContract));
        return address(newContract);
    }
}