contract Coin {
//关键字“public”使变量能从合约外部访问。
//铸币工人 - 负责发行货币
    address public minter;
//It is map['address'] = 余额。 可以随意设定
//账本 - 核心所在
    mapping (address => uint) public balances;

//事件让轻客户端能高效的对变化做出反应。
    event Sent(address from, address to, uint amount);

//这个构造函数的代码仅仅只在合约创建的时候被运行。
    function Coin() {
        minter = msg.sender;
    }
    
    //铸币
    function mint(address receiver, uint amount) {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }
    
    //流通
    function send(address receiver, uint amount) {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        
        //通知客户端，发送通知消息
        Sent(msg.sender, receiver, amount);
    }
}
