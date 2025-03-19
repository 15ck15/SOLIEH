// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IVertexAuction
/// @notice Interface for VertexAuction.
interface IVertexAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
