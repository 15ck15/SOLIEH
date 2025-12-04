// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBraveSplitter
/// @notice Interface for BraveSplitter.
interface IBraveSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
