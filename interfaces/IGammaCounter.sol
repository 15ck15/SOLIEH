// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IGammaCounter
/// @notice Interface for GammaCounter.
interface IGammaCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
