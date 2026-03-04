// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVertexSplitter2
/// @notice Interface for VertexSplitter2.
interface IVertexSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
