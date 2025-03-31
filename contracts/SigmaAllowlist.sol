// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SigmaAllowlist
/// @notice Owner-managed allowlist.
/// @custom:kind allowlist
contract SigmaAllowlist {
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

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }
}
