// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IStellarSplitter
/// @notice Interface for StellarSplitter.
interface IStellarSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
