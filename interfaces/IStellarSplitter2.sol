// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IStellarSplitter2
/// @notice Interface for StellarSplitter2.
interface IStellarSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
