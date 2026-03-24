// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IGoldenCounter
/// @notice Interface for GoldenCounter.
interface IGoldenCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
