<h1>外键约束设置约束动作</h1>

<p>on [<em>operate</em>]cascade</p>

<p>alter&nbsp;table&nbsp;成绩表&nbsp;add&nbsp;constraint FK_StudentNo&nbsp;foreign&nbsp;key&nbsp;(StudentNo)&nbsp;references&nbsp;Student(StudentNo)</p>

<p>on update cascade on delete cascade</p>

<p>级联更新，级联删除，这样在删除主表Student时，成绩表中该学生的所有成绩都会删除。</p>

<p>create&nbsp;table&nbsp;学生(学号&nbsp;char(10)&nbsp;,姓名&nbsp;char(10),&nbsp;性别&nbsp;char(2),primary&nbsp;key&nbsp;(学号));<br />
create&nbsp;table&nbsp;课程(课号&nbsp;char(10),课程名&nbsp;char(10),课时&nbsp;int，学分&nbsp;int),primary&nbsp;key&nbsp;(课号));<br />
create&nbsp;table&nbsp;成绩(学号&nbsp;char(10),课号&nbsp;char(10),成绩&nbsp;int,primary&nbsp;key(学号,课号),foreign&nbsp;key(学号)&nbsp;references&nbsp;学生&nbsp;on&nbsp;delete&nbsp;cascade,foreign&nbsp;key(课号)&nbsp;references&nbsp;课程&nbsp;on&nbsp;delete&nbsp;restrict);<br />
<br />
对成绩这张表的要求是&nbsp;<br />
当&nbsp;从学生这张表中删除一条记录时，从成绩表中也删除对应学号的记录，<br />
当&nbsp;从课程这种表中删除一条记录时，如果成绩表中已经有有对应课号的记录，将不能删除。</p>

<p>&nbsp;</p>

<h2>MySQL外键约束On&nbsp;Delete、On&nbsp;Update各取值的含义</h2>

<p><a href="http://photo.blog.sina.com.cn/showpic.html#blogid=5d359d310100w5mb&amp;url=http://s11.sinaimg.cn/orignal/5d359d31ga97c03eea53a" target="_blank"><img alt="MySQL外键约束On &lt;wbr&gt;Delete、On &lt;wbr&gt;Update各取值的含义" src="http://s11.sinaimg.cn/middle/5d359d31ga97c03eea53a&amp;690" style="height:141px; width:454px" title="MySQL外键约束On &lt;wbr&gt;Delete、On &lt;wbr&gt;Update各取值的含义" /></a></p>

<p>先看On Delete属性，可能取值如上图为：No Action, Cascade,Set Null, Restrict属性。</p>

<p>当取值为No Action或者Restrict时，则当在父表（即外键的来源表）中删除对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除。</p>

<p>当取值为Cascade时，则当在父表（即外键的来源表）中删除对应记录时，首先检查该记录是否有对应外键，如果有则也删除外键在子表（即包含外键的表）中的记录。</p>

<p>当取值为Set Null时，则当在父表（即外键的来源表）中删除对应记录时，首先检查该记录是否有对应外键，如果有则设置子表中该外键值为null（不过这就要求该外键允许取null）。</p>

<p><a href="http://photo.blog.sina.com.cn/showpic.html#blogid=5d359d310100w5mb&amp;url=http://s16.sinaimg.cn/orignal/5d359d31ga97c067b738f" target="_blank"><img alt="MySQL外键约束On &lt;wbr&gt;Delete、On &lt;wbr&gt;Update各取值的含义" src="http://s16.sinaimg.cn/middle/5d359d31ga97c067b738f&amp;690" style="height:163px; width:472px" title="MySQL外键约束On &lt;wbr&gt;Delete、On &lt;wbr&gt;Update各取值的含义" /></a><br />
<br />
当取值为No Action或者Restrict时，则当在父表（即外键的来源表）中更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许更新。</p>

<p>当取值为Cascade时，则当在父表（即外键的来源表）中更新对应记录时，首先检查该记录是否有对应外键，如果有则也更新外键在子表（即包含外键的表）中的记录。</p>

<p>当取值为Set Null时，则当在父表（即外键的来源表）中更新对应记录时，首先检查该记录是否有对应外键，如果有则设置子表中该外键值为null（不过这就要求该外键允许取null）。</p>

<p>&nbsp;</p>
