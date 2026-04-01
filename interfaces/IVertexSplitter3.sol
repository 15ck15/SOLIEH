// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVertexSplitter3
/// @notice Interface for VertexSplitter3.
interface IVertexSplitter3 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
