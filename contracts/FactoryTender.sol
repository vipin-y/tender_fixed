pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./Tender.sol";


contract FactoryTender {
    address[] allTenders;

    constructor () public {

    }

    function createTender(address governmentOfficerAddress, string memory tenderName, string memory tenderId, 
    //string organisationChain, string tenderRefNum,
    uint bidSubmissionClosingDate, uint bidOpeningDate, uint covers, string[] memory clauses,
    string[] memory taskName, uint[] memory taskDays, 
    string[] memory constraints) public returns (address) {
        Tender newTender = new Tender();
        newTender.setTenderBasic(address(this), tenderName, tenderId, 
        //organisationChain, tenderRefNum,
        bidSubmissionClosingDate, bidOpeningDate, covers);
        newTender.setTenderAdvanced(clauses,
        taskName, taskDays, 
        constraints);
        allTenders.push(address(newTender));
        return address(newTender);
    }
}