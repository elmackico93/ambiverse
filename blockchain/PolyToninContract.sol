
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolyTonin {
    // Mappatura degli utenti con il loro saldo Tonin
    mapping(address => uint256) public toninBalance;
    address public owner;

    // Evento per tracciare i contributi degli utenti
    event Contribution(address indexed user, uint256 value, string contributionType);

    constructor() {
        owner = msg.sender;
    }

    // Funzione per premiare contributi tecnologici riducendo il saldo di Tonin
    function rewardContribution(address user, string memory contributionType) public {
        require(msg.sender == owner, "Solo l'owner puo premiare");
        // Riduzione del Tonin in base a un contributo
        if (keccak256(bytes(contributionType)) == keccak256(bytes("tecnologico"))) {
            toninBalance[user] -= 10; // Esempio di riduzione per contributi tecnologici
        }
        emit Contribution(user, 10, contributionType);
    }

    // Funzione per controllare il saldo di Tonin
    function getToninBalance(address user) public view returns (uint256) {
        return toninBalance[user];
    }
}
