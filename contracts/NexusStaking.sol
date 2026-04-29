// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NexusStaking
/// @notice Eth staking with accrued rewards accounting.
/// @custom:kind staking
contract NexusStaking {
    uint256 public constant RATE_BPS = 1000;
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

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }
}
