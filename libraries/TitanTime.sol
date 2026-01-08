// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TitanTime
/// @notice Reusable helper functions.
library TitanTime {
    function minutesToSeconds(uint256 m) internal pure returns (uint256) {
        return m * 1 minutes;
    }

    function hoursToSeconds(uint256 h) internal pure returns (uint256) {
        return h * 1 hours;
    }

    function daysToSeconds(uint256 d) internal pure returns (uint256) {
        return d * 1 days;
    }
}
