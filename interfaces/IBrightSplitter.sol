// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBrightSplitter
/// @notice Interface for BrightSplitter.
interface IBrightSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
