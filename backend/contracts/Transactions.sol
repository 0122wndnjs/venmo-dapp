// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Transactions {
    // Number of transactions
    uint256 transactionCount;

    // This will be an event that will be fired when a transaction is made
    event Transfer(address from, address receiver, uint amount, string message, uint timestamp);

    // Struc of the transactions that we will be storing on chain
    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
    }

    // Array of transactions 
    TransferStruct[] transactions;

    // Fuction to add a transaction to the blockchain with our struct
    function addToBlockchain(address payable receiver, uint amount, string memory message) public {
        transactionCount += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp));

        // emit the event we created earlier
        emit Transfer(msg.sender, receiver, amount, message, block.timestamp);
    }
}