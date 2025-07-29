// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title CrystalAllowlist
/// @notice Owner-managed allowlist.
/// @custom:kind allowlist
contract CrystalAllowlist {
    address public owner;
    mapping(address => bool) public isAllowed;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event AllowedSet(address indexed account, bool allowed);

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    function setAllowed(address account, bool allowed) external onlyOwner {
        isAllowed[account] = allowed;
        emit AllowedSet(account, allowed);
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Returns the larger of two values.
    function maxOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }
}
