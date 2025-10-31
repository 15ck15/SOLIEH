// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IDeltaCounter
/// @notice Interface for DeltaCounter.
interface IDeltaCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
