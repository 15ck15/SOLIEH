// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IThunderAuction
/// @notice Interface for ThunderAuction.
interface IThunderAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
