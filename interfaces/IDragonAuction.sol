// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IDragonAuction
/// @notice Interface for DragonAuction.
interface IDragonAuction {
    function bid() external payable;
    function withdraw() external returns (bool);
    function endAuction() external;
    function highestBid() external view returns (uint256);
}
