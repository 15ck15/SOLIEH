// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICobaltAllowlist
/// @notice Interface for CobaltAllowlist.
interface ICobaltAllowlist {
    function owner() external view returns (address);
    function isAllowed(address account) external view returns (bool);
    function setAllowed(address account, bool allowed) external;
    function transferOwnership(address newOwner) external;
}
