// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {

    Level0 public level0 = Level0(0xADb31e24bE04846754f13ad5c4AdceC36CE9415e);

    function run() external {
        uint256 deployerPrivateKey = uint256(vm.envBytes32("PRIVATE_KEY"));
        string memory password = level0.password();
        console.log("Password: ", password);
        vm.startBroadcast(deployerPrivateKey);
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}