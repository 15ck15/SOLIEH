// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BoldVesting
/// @notice Linear eth vesting.
/// @custom:kind vesting
contract BoldVesting {
    address public immutable beneficiary;
    uint256 public immutable start;
    uint256 public immutable duration;
    uint256 public released;

    event TokensReleased(uint256 amount);

    constructor(address account, uint256 vestingDuration) payable {
        require(account != address(0), "zero address");
        require(vestingDuration > 0, "zero duration");
        beneficiary = account;
        start = block.timestamp;
        duration = vestingDuration;
    }

    receive() external payable {}

    function vested() public view returns (uint256) {
        uint256 total = address(this).balance + released;
        if (block.timestamp >= start + duration) {
            return total;
        }
        return (total * (block.timestamp - start)) / duration;
    }

    function release() external {
        uint256 amount = vested() - released;
        require(amount > 0, "nothing to release");
        released += amount;
        (bool ok, ) = beneficiary.call{value: amount}("");
        require(ok, "transfer failed");
        emit TokensReleased(amount);
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }

    /// @notice Returns the larger of two values.
    function maxOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }
}
