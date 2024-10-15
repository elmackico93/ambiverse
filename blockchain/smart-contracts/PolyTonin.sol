// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PolyTonin is ERC20, Ownable {
    mapping(address => bool) public wiseUsers; // Mapping degli utenti saggi

    // Evento per tracciare i contributi
    event Contribution(address indexed user, uint256 value, string contributionType);
    event SageUser(address indexed user, string message);

    constructor(uint256 initialSupply) ERC20("Tonin", "TON") {
        _mint(msg.sender, initialSupply);
    }

    // Funzione per premiare i contributi con la riduzione del saldo di Tonin
    function rewardContribution(address user, string memory contributionType, uint256 amount) public onlyOwner {
        require(balanceOf(user) >= amount, "Saldo insufficiente per premiare il contributo.");
        _burn(user, amount); // Riduce il saldo di Tonin dell'utente
        if (balanceOf(user) == 0) {
            wiseUsers[user] = true;
            emit SageUser(user, "Hai raggiunto la saggezza con 0 Tonin.");
        }
        emit Contribution(user, amount, contributionType);
    }

    // Override per limitare le transazioni degli utenti saggi
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        require(!wiseUsers[from], "Gli utenti saggi non possono trasferire Tonin.");
        super._beforeTokenTransfer(from, to, amount);
    }

    // Funzione per mintare nuovi Tonin (riservata all'owner)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Funzione per controllare il saldo di Tonin
    function getToninBalance(address user) public view returns (uint256) {
        return balanceOf(user);
    }
}
