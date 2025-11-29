// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IFrostCounter
/// @notice Interface for FrostCounter.
interface IFrostCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
