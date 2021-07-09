const SharedWallet = artifacts.require("SharedWallet");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
 
 contract("SharedWallet", accounts => {
  const [firstAccount, secondAccount] = accounts;

  it("sets an owner", async () => {
    sw = await SharedWallet.new();
    assert.equal(await sw.owner.call(), firstAccount);
  });
});

// contract("SharedWallet test", async function (accounts) {
//   const [firstAccount, secondAccount] = accounts;

//   it("Anyone can deposit", async () =>  {
//     const sw = await SharedWallet.new();
//     // // await SharedWallet sw = new SharedWallet();
//     // sw.address.transfer(100)
//     // assert.isTrue(sw.address.balance == 100);
    
//     // const instance = await SharedWallet.deployed();
//     // const balance = await instance.getBalance.call(accounts[0]);
//     // assert.equal(sw.address.balance.valueOf(), 10000);
//   });
  
// });
