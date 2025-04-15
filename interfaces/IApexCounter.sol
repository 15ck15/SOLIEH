// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IApexCounter
/// @notice Interface for ApexCounter.
interface IApexCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
