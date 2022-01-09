// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import 'hardhat/console.sol';

contract WavePortal {
    uint256 totalWaves;

    uint256 private seed;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver; // address of the user who waved.
        string message; // the message the user sent.
        uint256 timestamp; // the timestamp when the user waved.
    }

    Wave[] waves;

    //
    mapping(address => uint256) public lastWavedAt;

    constructor() payable {
        console.log('I am smart!');
        // initial seed
        seed = (block.timestamp + block.difficulty) % 100;
    }

    function wave(string memory _message) public {
        require(
            lastWavedAt[msg.sender] + 30 seconds < block.timestamp,
            'Must wait 30 seconds before waving again.'
        );

        // update current timestamp for the user
        lastWavedAt[msg.sender] = block.timestamp;

        totalWaves += 1;
        console.log('%s has waved w/ message %s', msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        // generate new seed for next user that send a wave
        seed = (block.timestamp + block.difficulty + seed) % 100;
        console.log('Random # generated: %d', seed);

        if (seed <= 50) {
            console.log('%s won!', msg.sender);

            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                'Trying to withdraw more money than the contract has.'
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}('');
            require(success, 'Failed to withdraw money from contract.');
        }

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log('We have %d total waves!', totalWaves);
        return totalWaves;
    }
}
