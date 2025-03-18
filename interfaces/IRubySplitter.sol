// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRubySplitter
/// @notice Interface for RubySplitter.
interface IRubySplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
