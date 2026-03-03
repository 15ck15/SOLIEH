// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISolarCounter
/// @notice Interface for SolarCounter.
interface ISolarCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
