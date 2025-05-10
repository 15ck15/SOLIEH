// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISigmaCounter
/// @notice Interface for SigmaCounter.
interface ISigmaCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
