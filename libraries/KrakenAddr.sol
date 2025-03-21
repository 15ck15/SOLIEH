// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title KrakenAddr
/// @notice Reusable helper functions.
library KrakenAddr {
    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }

    function sendValue(address payable to, uint256 amount) internal {
        require(address(this).balance >= amount, "insufficient balance");
        (bool ok, ) = to.call{value: amount}("");
        require(ok, "send failed");
    }
}
