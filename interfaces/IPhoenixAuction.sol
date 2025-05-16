// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPhoenixAuction
/// @notice Interface for PhoenixAuction.
interface IPhoenixAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
