// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    mapping(address => uint) public balances;
    address[] public users;  // Kullanıcı adreslerini saklayacak dizi

    constructor() payable {}

    function deposit() public payable {
        require(msg.value > 0, "Yatirilan miktar sifirdan buyuk olmalidir.");
        if (balances[msg.sender] == 0) {
            users.push(msg.sender);  // Eğer kullanıcı ilk defa yatırıyorsa, adresi diziye ekleyin
        }
        balances[msg.sender] += msg.value;  // Kullanıcının bakiyesini güncelleyin
    }

    function getBalance(address user) public view returns (uint) {
        return balances[user];  // Belirtilen kullanıcının bakiyesini döndürür
    }

    // Sözleşmeye Ether yatırmış tüm kullanıcıların adreslerini döndürür
    function getAllUsers() public view returns (address[] memory) {
        return users;
    }

    // Sözleşmenin toplam Ether bakiyesini döndürür
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
