// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISwiftSplitter
/// @notice Interface for SwiftSplitter.
interface ISwiftSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
