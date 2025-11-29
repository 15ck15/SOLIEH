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

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }
}
