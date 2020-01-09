pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;


contract ContractorRepo {
    address[] contractors; //all contractors verified + unverified
    address[] verifiedContractors;
    //address[] unverifiedContractors;
    
    mapping (address=>bool) verifiedStatus; //false => unverified, true => verified
    mapping (address=>address) contratorToVerifier;
    mapping (address=>address) public walletAddressToNode;


    constructor () public {

    }

    function newContractor(address walletAddress, address nodeAddress) public returns (bool) {
        contractors.push(nodeAddress);
        verifiedStatus[nodeAddress] = false;
        mapWalletAddressToNode(walletAddress,nodeAddress);
        return true;
    }

    function mapWalletAddressToNode(address walletAddress, address nodeAddress) public {
        walletAddressToNode[walletAddress] = nodeAddress;
    }

    function verifyContractor(address contractorAddress, address verifierAddress) public {
        verifiedContractors.push(contractorAddress);
        verifiedStatus[contractorAddress] = true;
        contratorToVerifier[contractorAddress] = verifierAddress;
    }

    function getVerifiedContractorsCount() public returns (uint256) {
        return verifiedContractors.length;
    }
        
    function getVerifiedContractors() public returns (address[] memory ) {
        return verifiedContractors;
    }

    function getVerifier(address contractorAddress) public returns (address) {
        return contratorToVerifier[contractorAddress];
    }

    function getContractors() public returns (address[] memory ) {
        return contractors;
    }

    function getContractorsCount() public returns (uint256) {
        return contractors.length;
    }

    function getVerificationStatus(address contractorAddress) public returns (bool) {
        return verifiedStatus[contractorAddress];
    }
    
    function getUnverifiedContractors(uint256 index) public returns (address) {
        //loop at web3
        if (index > contractors.length) revert();
        if (!verifiedStatus[contractors[index]]) {
            return contractors[index]; 
        }
        revert();
    }
}