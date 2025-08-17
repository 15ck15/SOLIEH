// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IIronCounter
/// @notice Interface for IronCounter.
interface IIronCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
