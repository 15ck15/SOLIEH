// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IQuantumAuction
/// @notice Interface for QuantumAuction.
interface IQuantumAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
