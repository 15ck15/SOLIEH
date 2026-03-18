// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRavenRegistry
/// @notice Interface for RavenRegistry.
interface IRavenRegistry {
    function register(string calldata label) external;
    function transfer(string calldata label, address to) external;
    function ownerOf(bytes32 key) external view returns (address);
}
