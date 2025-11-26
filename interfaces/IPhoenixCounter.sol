// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPhoenixCounter
/// @notice Interface for PhoenixCounter.
interface IPhoenixCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
