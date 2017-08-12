pragma solidity ^0.4.0;

contract SendAndReceiveByContract{

  //fallback函数对应记录事件
  event fallbackTrigged(bytes data);
  //合约接收send()的 ether时，必须存在
  function() payable{fallbackTrigged(msg.data);}

  //存入一些ether用于后面的测试
  function deposit() payable{
  }

  //查询当前的余额
  function getBalance() constant returns(uint){
      return this.balance;
  }

  event SendEvent(address to, uint value, bool result);
  //使用send()发送ether
  function sendEther(){
        //使用this来模拟从另一个合约发送
      bool result = this.send(1);
      SendEvent(this, 1, result);
  }
}
