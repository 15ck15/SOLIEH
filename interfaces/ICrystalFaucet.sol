// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICrystalFaucet
/// @notice Interface for CrystalFaucet.
interface ICrystalFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
