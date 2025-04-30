// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IOmegaCounter
/// @notice Interface for OmegaCounter.
interface IOmegaCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
