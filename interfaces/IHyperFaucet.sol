// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IHyperFaucet
/// @notice Interface for HyperFaucet.
interface IHyperFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
