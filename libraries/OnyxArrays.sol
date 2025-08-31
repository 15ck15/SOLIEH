// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OnyxArrays
/// @notice Reusable helper functions.
library OnyxArrays {
    function sum(uint256[] memory values) internal pure returns (uint256 total) {
        for (uint256 i = 0; i < values.length; i++) {
            total += values[i];
        }
    }

    function contains(uint256[] memory values, uint256 target) internal pure returns (bool) {
        for (uint256 i = 0; i < values.length; i++) {
            if (values[i] == target) return true;
        }
        return false;
    }
}
