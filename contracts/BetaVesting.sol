// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BetaVesting
/// @notice Linear eth vesting.
/// @custom:kind vesting
contract BetaVesting {
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

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "BetaVesting";
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }
}
