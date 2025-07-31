// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SwiftAllowlist
/// @notice Owner-managed allowlist.
/// @custom:kind allowlist
contract SwiftAllowlist {
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

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }
}
