+ 寻找其他通过修改printf使这段C代码崩溃的方法。
	-错误格式符：用%s打印整数（如printf("%s", distance)），会将整数值视为内存地址，导致非法内存访问（Segmentation Fault）

	- 指针类型错误：将char变量用%s打印（如printf("%s", initial)），会导致读取无效地址（ASCII码值被视为地址），触发Invalid read of size 1错误

	-越界访问：使用%n写入未初始化的指针变量，可能导致未定义行为

	- 空指针解引用：传递NULL指针给%s（如printf("%s", (char*)0)），某些编译器会输出"(null)"，但可能导致段错误

+ 搜索“printf格式化”，试着使用一些高级的占位符。
见excise/ex1-additional.c

+ 研究可以用几种方法打印数字。尝试以八进制或十六进制打印，或者其它你找到的方法。
	- 八进制：%o输出无前缀，%#o添加前缀0。
```C
printf("%o %#o", 100, 100); // 输出：144 0144
```

	- 十六进制：%x小写，%X大写，%#x添加0x前缀。
```C
printf("%x %#X", 255, 255); // 输出：ff 0XFF
```

	- 二进制模拟：C标准不支持直接输出二进制，但可通过位操作转换。
```C
int num = 10;
for (int i=31; i>=0; i--) printf("%d", (num >> i) & 1); // 输出：00000000000000000000000000001010
```

+ 试着打印空字符串，即""。

合法空字符串：直接打印空字符串不会崩溃。
```C
printf("%s", ""); // 输出：（无内容）
```
空指针风险：若指针未初始化或为NULL，可能导致段错误。

```C
char *empty = NULL;
printf("%s", empty); // 可能崩溃（需检查指针有效性）
```
安全写法：添加空指针检查。

```C
if (empty != NULL) printf("%s", empty);
else printf("(null)");
```
