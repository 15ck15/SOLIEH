// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INobleAuction
/// @notice Interface for NobleAuction.
interface INobleAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
