// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVertexSplitter
/// @notice Interface for VertexSplitter.
interface IVertexSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
