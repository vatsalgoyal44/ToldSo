// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract ToldSo {
    struct Post{
        string title;
        string body;
        uint256 timestamp;
    }

    mapping(address => Post[]) public authorToPosts;

    function createPost(string memory title, string memory body) external {
        Post memory post = Post(title, body, block.timestamp);
        authorToPosts[msg.sender].push(post);
    }

    function getPostsByAuthor(address author)
        external
        view
        returns (Post[] memory)
    {
        return authorToPosts[author];
    }
}

