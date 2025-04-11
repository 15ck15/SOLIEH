// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBetaAuction
/// @notice Interface for BetaAuction.
interface IBetaAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
