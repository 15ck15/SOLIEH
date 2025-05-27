// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMetaRegistry
/// @notice Interface for MetaRegistry.
interface IMetaRegistry {
    function register(string calldata label) external;
    function transfer(string calldata label, address to) external;
    function ownerOf(bytes32 key) external view returns (address);
}
