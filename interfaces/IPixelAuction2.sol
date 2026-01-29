// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPixelAuction2
/// @notice Interface for PixelAuction2.
interface IPixelAuction2 {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
