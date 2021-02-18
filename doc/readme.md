函数可见性:

external
外部函数作为合约接口的一部分，意味着我们可以从其他合约和交易中调用。 一个外部函数 f 不能从内部调用（即 f 不起作用，但 this.f() 可以）。 当收到大量数据的时候，外部函数有时候会更有效率，因为数据不会从calldata复制到内存.

public
public 函数是合约接口的一部分，可以在内部或通过消息调用。对于 public 状态变量， 会自动生成一个 getter 函数（见下面）。

internal
这些函数和状态变量只能是内部访问（即从当前合约内部或从它派生的合约访问），不使用 this 调用。

private
private 函数和状态变量仅在当前定义它们的合约中使用，并且不能被派生合约使用。

view
函数声明为view类型时, 保证不修改状态

pure
保证不读取和修改状态
以下被认为是读取状态：
1. 读取状态变量。
2. 访问 address(this).balance 或者 <address>.balance。
3. 访问 block，tx， msg 中任意成员 （除 msg.sig 和 msg.data 之外）。
4. 调用任何未标记为 pure 的函数。
5. 使用包含某些操作码的内联汇编。

receive 接收以太函数
一个合约最多有一个 receive 函数, 声明函数为： receive() external payable { ... }

不需要 function 关键字，也没有参数和返回值并且必须是　external　可见性和　payable 修饰． 它可以是 virtual 的，可以被重载也可以有 修改器modifier 。

在对合约没有任何附加数据调用（通常是对合约转账）是会执行 receive 函数．　例如　通过 .send() or .transfer() 如果 receive 函数不存在，　但是有payable　的 fallback 回退函数 那么在进行纯以太转账时，fallback 函数会调用．

如果两个函数都没有，这个合约就没法通过常规的转账交易接收以太（会抛出异常）