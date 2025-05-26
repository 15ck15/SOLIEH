// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title EmberEscrow
/// @notice Three-party escrow.
/// @custom:kind escrow
contract EmberEscrow {
    address public immutable payer;
    address public immutable payee;
    address public immutable arbiter;
    bool public settled;

    event Funded(address indexed account, uint256 amount);
    event Released(address indexed account, uint256 amount);
    event Refunded(address indexed account, uint256 amount);

    constructor(address _payee, address _arbiter) payable {
        require(_payee != address(0) && _arbiter != address(0), "zero address");
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
        emit Funded(msg.sender, msg.value);
    }

    function release() external {
        require(msg.sender == payer || msg.sender == arbiter, "unauthorized");
        require(!settled, "already settled");
        settled = true;
        uint256 amount = address(this).balance;
        (bool ok, ) = payee.call{value: amount}("");
        require(ok, "transfer failed");
        emit Released(payee, amount);
    }

    function refund() external {
        require(msg.sender == payee || msg.sender == arbiter, "unauthorized");
        require(!settled, "already settled");
        settled = true;
        uint256 amount = address(this).balance;
        (bool ok, ) = payer.call{value: amount}("");
        require(ok, "transfer failed");
        emit Refunded(payer, amount);
    }

    /// @notice Returns the smaller of two values.
    function minOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a < b ? a : b;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "EmberEscrow";
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }
}
