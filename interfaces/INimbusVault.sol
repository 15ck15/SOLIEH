// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INimbusVault
/// @notice Interface for NimbusVault.
interface INimbusVault {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
    function deposits(address account) external view returns (uint256);
    function totalDeposits() external view returns (uint256);
}
