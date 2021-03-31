# Lab3实验报告

PB17111623

范睿

### 实验分析

##### 组相连度与缓存大小对缓存性能的影响

###### 命中率

<img src="img\MM_FIFO.jpg" width="400px"><img src="img\MM_LRU.jpg" width="400">

###### 运行时间

<img src="img\MM_FIFO_TIME.jpg" width="400"><img src="img\MM_LRU_TIME.jpg" width="400">

***（1,2）表示SET_ADDR_LEN=1,LINE_ADDR_LEN=2，其他的以此类推**



根据图像观察：

* 对于任意一种cache大小，任意一种算法，随着组相连度的增加，命中率都逐渐上升，运行时间都逐渐下降，性能逐渐提升。
* 对于任意一种算法，在同一组相连度下，cache越大，命中率越高，运行时间越短，性能越高。
* 通过观察曲线走向，随着组相连度增加，cache参数为(3,3)的命中率比(2,3)的上升的更快，运行时间比(2,3)的下降的更快，性能提升的更快，因此(3,3)和(3,4)要整体地优于(2,3)和(1,2)的cache

##### 替换策略对于cache性能的影响

###### 命中率

<img src="img\COMP_MM_MISSRATE.png" width="400"><img src="img\COMP_QS_MISSRATE.png" width="400">

###### 运行时间

<img src="img\COMP_MM_TIME.png" width="400"><img src="img\COMP_QS_TIME.png" width="400">



根据图像的观察：

* 不论在那种测试下，LRU策略的命中率全部高于FIFO的命中率，LRU的运行时间全部少于FIFO的运行时间。因此可以得出结论，LRU的综合表现比FIFO要好。

##### 缓存大小对于电路面积的影响

<img src="img\level1_1.png" width="400"><img src="img\level1_2.png" width="400">

​										(1,2,2)																						(2,3,4)

<img src="img\level1_3.png" width="400"><img src="img\level1_4.png" width="400">

​										(3,3,6)																						(3,4,8)

***(1,2,2)表示SET_ADDR_LEN=1,LINE_ADDR_LEN=2,WAY_CNT=2,其他的以此类推**



观察表格可以看出：

* 随着cache大小的增加，LUT和FF的利用率都增加

##### 组相联度对于电路面积的影响

<img src="img\level1_5.png" width="400"><img src="img\level1_6.png" width="400">

​										(3,3,2)																						(3,3,4)

<img src="img\level1_3.png" width="400"><img src="img\level1_7.png" width="400">

​										(3,3,6)																						(3,3,8)

* 随组相连度增加，LUR和FF的利用率都增加

##### 具体数据

<img src="img\MM_FIFO1.png" width="400px"><img src="img\MM_LRU1.png" width="400px">

<img src="img\QS_FIFO1.png" width="400px"><img src="img\QS_LRU1.png" width="400px">

***注意这里面(2,3)与(3,3)对应的列反了。。**

具体的仿真结果在SimulationData文件夹下，由于太多了，就不全部放在报告里了

SimulationData文件夹下的命名解释：

比如MM_FIFO_1.png，表示矩阵乘法测试下，使用FIFO替换策略，cache参数为(3,3),WAY_CNT=2时的仿真结果

MM_FIFO_x.png：x与表格对应关系如下

| x     | cache参数 | WAY_CNT |
| ----- | --------- | ------- |
| 1-5   | (3,3)     | 2-10    |
| 6-10  | (1,2)     | 2-10    |
| 11-15 | (2,3)     | 2-10    |
| 16-20 | (3,4)     | 2-10    |

### 实验结论

cache大小的增加、组连通度的增加、使用LRU都可以使cache的性能提升。其中cache大小的增加对于cache性能的提升是显著的；提升组相连度也能在一定程度上提升cache性能，但是如果cache大小不足，对于命中率的提升到一定程度就遇到了瓶颈，即使再增加组连通度也无法继续提升性能。

但是cache大小的增加也会显著地增加cache的电路面积。太大的大小会使得LUT与FF的利用率提升很快；而增加组相连度时，电路面积的增加比较缓慢。

因此，综合以上所有数据，参数为(3,3)，即SET_ADDR_LEN=3,LINE_ADDR_LEN=3，组相连度为6的cache在命中率和电路面积上都有着极强的优势。它既有高命中率和低运行时间，又消耗较少的电路资源。