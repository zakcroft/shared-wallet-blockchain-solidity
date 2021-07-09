const SharedWallet = artifacts.require("SharedWallet");

require('chai')
    .use(require('chai-as-promised'))
    .should()

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SharedWallet test", (accounts) => {
  const [firstAccount, secondAccount] = accounts;
  let sw;

  before(async () => {
    const sw = await SharedWallet.new();
  })

   it("sets an owner", async () => {
     assert.equal(await sw.owner.call(), firstAccount);
   });

  it('Anyone can deposit', async () => {
    const name = await daiToken.name()
    assert.equal(sw.address.balance, 20, 'Mock DAI Token')
  })

  //describe('Anyone can deposit', async () => {


// sw.address.transfer(100)
// assert.isTrue(sw.address.balance == 100);

// const instance = await SharedWallet.deployed();
// const balance = await instance.getBalance.call(accounts[0]);
// assert.equal(sw.address.balance.valueOf(), 10000);
});
 
// contract("SharedWallet", accounts => {
//  const [firstAccount, secondAccount] = accounts;
//
//  it("sets an owner", async () => {
//    sw = await SharedWallet.new();
//    assert.equal(await sw.owner.call(), firstAccount);
//  });
//});


  

