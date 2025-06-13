// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title EmberFaucet
/// @notice Testnet faucet with cooldown.
/// @custom:kind faucet
contract EmberFaucet {
    address public owner;
    uint256 public dripAmount;
    uint256 public cooldown;
    mapping(address => uint256) public lastDrip;

    event Dripped(address indexed to, uint256 amount);
    event Funded(address indexed from, uint256 amount);

    constructor(uint256 amount, uint256 waitTime) {
        owner = msg.sender;
        dripAmount = amount;
        cooldown = waitTime;
    }

    receive() external payable {
        emit Funded(msg.sender, msg.value);
    }

    function drip() external {
        require(
            lastDrip[msg.sender] == 0 || block.timestamp >= lastDrip[msg.sender] + cooldown,
            "cooldown active"
        );
        require(address(this).balance >= dripAmount, "faucet empty");
        lastDrip[msg.sender] = block.timestamp;
        (bool ok, ) = msg.sender.call{value: dripAmount}("");
        require(ok, "transfer failed");
        emit Dripped(msg.sender, dripAmount);
    }

    function setDripAmount(uint256 amount) external {
        require(msg.sender == owner, "not owner");
        dripAmount = amount;
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }
}
