// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SilverStaking
/// @notice Eth staking with accrued rewards accounting.
/// @custom:kind staking
contract SilverStaking {
    uint256 public constant RATE_BPS = 500;
    uint256 private constant YEAR = 365 days;

    struct Position {
        uint256 amount;
        uint256 accrued;
        uint256 since;
    }

    mapping(address => Position) public positions;

    event Staked(address indexed account, uint256 amount);
    event Unstaked(address indexed account, uint256 amount);

    function stake() external payable {
        require(msg.value > 0, "zero stake");
        Position storage p = positions[msg.sender];
        _settle(p);
        p.amount += msg.value;
        emit Staked(msg.sender, msg.value);
    }

    function unstake(uint256 amount) external {
        Position storage p = positions[msg.sender];
        require(p.amount >= amount, "insufficient stake");
        _settle(p);
        p.amount -= amount;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "transfer failed");
        emit Unstaked(msg.sender, amount);
    }

    function pendingReward(address account) external view returns (uint256) {
        Position storage p = positions[account];
        return p.accrued + _elapsedReward(p);
    }

    function _settle(Position storage p) internal {
        p.accrued += _elapsedReward(p);
        p.since = block.timestamp;
    }

    function _elapsedReward(Position storage p) internal view returns (uint256) {
        if (p.amount == 0) return 0;
        return (p.amount * RATE_BPS * (block.timestamp - p.since)) / (10_000 * YEAR);
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "SilverStaking";
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Returns the larger of two values.
    function maxOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }
}
