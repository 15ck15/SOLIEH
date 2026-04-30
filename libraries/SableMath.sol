// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SableMath
/// @notice Reusable helper functions.
library SableMath {
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a : b;
    }

    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        return (a & b) + (a ^ b) / 2;
    }

    function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "division by zero");
        return a == 0 ? 0 : (a - 1) / b + 1;
    }
}
