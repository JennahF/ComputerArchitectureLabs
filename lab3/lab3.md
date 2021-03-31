#### CA实验三

PB17121741 王志远

##### 实验设计

本实验全部采用“写回+写入分派”的cache策略，这种策略在读或写命中时，直接从cache中读写数据，只需要一个时钟周期，不需要对CPU流水线进行stall；在发生缺失时，读缺失和写缺失的处理方法是相同的，都是从主存中换入缺失的line（line即块）到cache中（当然，如果要换入的line已经被使用了，并且脏，则需要在换入之前进行换出），再从cache中读写数据。总结下来，cache应该维护如下的状态机：

![image-20200517201844654](C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517201844654.png)

当没有读/写请求时，cache保持就绪状态，当CPU发出读/写请求时，cache检查是否命中，如果命中则立刻响应读/写请求，并仍保持就绪状态。如果缺失，则进行换入（换入之前可能需要先换出），在cache进行换出换入时，cache无法响应CPU当前的读写请求，因此需要向CPU发出miss=1的信号，CPU需要使用该信号控制所有流水段进行stall。直到cache完成换出换入后重回就绪状态，此时cache就能响应这个读写请求。

下图是组相连cache的结构图。取LINE_ADDR_LEN=3，SET_ADDR_LEN=2, TAG_ADDR=12，WAY_CNT=4为例。

![image-20200517202009528](C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517202009528.png)

相比直接相连cache，组相连cache需要加入的有：

1)   将图9中所示的数组添加一个维度，该维度的大小为 WAY_CNT

2)   实现并行命中判断：为了判断是否命中，直接相连cache每次只需要判断一个valid，一个dirty，一个TAG是否命中，但组相连cache则需要在组内并行的判断每路line是否命中

对于命中的判断，在SystemVerilog中通过for语句实现，如下所示



3)   实现替换策略：当cache需要换出时，直接相连cache没有选择，因为每个组中只有1个line，只能换出换入这唯一的line。但组相连cache需要决策换出哪个line。本实验要求实现FIFO换出策略与LRU换出策略。为了实现FIFO策略和LRU策略，还需要加入一些辅助的wire和reg变量。

- 对于fifo策略和cache策略，我们的module对外接口都是相同的
- 如图swapaddr指将被替换的地址
- <img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517204430485.png" alt="image-20200517204430485" style="zoom:67%;" />
- 对于fifo策略，每个set返回的wayaddr是01230123的循环，我们只需要维护一个计数器组，使得每个set都可以返回一个wayaddr即可
- <img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517204641411.png" alt="image-20200517204641411" style="zoom: 67%;" />
- 而对于lru策略，对于每个set的每一路我们都需要维护一个计数器，该计数器在没有被访问情况每个时钟加1，被访问后清零，对于某个set的换入请求，我们需要使用for语句在所有的计时器中找一个最大的并返回其wayaddr .

##### 性能和资源测试评估

###### 权衡cache size增大的性能和面积



######  权衡选择合适的组相连度

显然，组相联度提升会带来cachesize的增大，下面就限定cachesize的情况下修改组相联度，并观察

以下是实验数据：



|      |      |      |
| ---- | ---- | ---- |
|      |      |      |
|      |      |      |
|      |      |      |

以下是对实验数据的分析

###### 权衡替换策略的区别

通常认为lru替换策略性能更好，但是实验中出现了给定某组参数后lru的策略略弱于fifo的情况，而fifo的面积优势更明显

以下是实验数据





结论：有时候简单策略比复杂策略效果不差很多甚至可能更好，而使用复杂电路实现复杂替换策略带来的收益有时并不明显，并不如简单替换策略的面积优势。因此在我们的设计实现中，应尽可能使用简单的设计策略，除非有特别的性能要求。

###### 理解写回法的优劣



##### Reference

感谢黄一凡助教在实验过程中给我的支持，教会了我如何正确使用for循环语句

感谢所有为体系结构实验更新换代做出贡献的老师和助教！

https://git.lug.ustc.edu.cn/Mine/ustc_ca2020_lab/-/tree/master

Lab3-王轩-cache编写指导.docx

Lab3-王轩-cache实验指导.docx

##### 附录

以下是实验截图

<img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517212504290.png" alt="image-20200517212504290" style="zoom:50%;" />

<img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517220358603.png" alt="image-20200517220358603" style="zoom:50%;" />

<img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517220556255.png" alt="image-20200517220556255" />

<img src="C:\Users\WZY\AppData\Roaming\Typora\typora-user-images\image-20200517220556255.png" alt="image-20200517220556255" style="zoom:50%;" />

