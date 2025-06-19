// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICrystalCounter
/// @notice Interface for CrystalCounter.
interface ICrystalCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
