## 本项目实现的最终作用是基于SSH简单设备信息管理系统
## 分为2个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 修改管理员资料
 - 生产厂商管理
 - 用户管理
 - 管理员登录
 - 设备信息管理
 - 部门管理
### 第2个角色为用户角色，实现了如下功能：
 - 修改个人资料
 - 查看生产厂商
 - 查看设备信息
 - 查看部门信息
 - 用户登录
## 数据库设计如下：
# 数据库设计文档

**数据库名：** ssh_jiandansheibei_manage

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [t_bumen](#t_bumen) |  |
| [t_sccs](#t_sccs) |  |
| [t_shebeifile](#t_shebeifile) |  |
| [t_user](#t_user) | 用户表 |

**表名：** <a id="t_bumen">t_bumen</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | t_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  3   | t_fzrxm |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | t_fzrdh |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | t_tjrq |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | t_bz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="t_sccs">t_sccs</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | t_mingzi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | t_dizhi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | t_fzrxm |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | t_fzrdh |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | t_tjrq |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | t_bz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="t_shebeifile">t_shebeifile</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | f_uploadName |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 文件名称  |
|  3   | f_fileName |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 上传文件名  |
|  4   | f_uploadTime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 上传时间  |
|  5   | t_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  6   | t_xh |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | t_price |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | t_fzrxm |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | t_fzrdh |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | t_ccrq |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | t_tjrq |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  12   | t_bz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  13   | sccs_id |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  14   | bumen_id |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="t_user">t_user</a>

**说明：** 用户表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | u_username |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | u_password |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  4   | u_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  5   | u_birthday |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 生日  |
|  6   | u_sex |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 性别  |
|  7   | u_tel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  8   | u_lxr |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 联系人  |
|  9   | u_phone |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  10   | u_jg |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 籍贯  |
|  11   | u_address |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 家庭地址  |
|  12   | u_bm |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | u_type |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户类型  |
|  14   | u_by_1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备用字段1  |
|  15   | u_by_2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备用字段2  |
|  16   | u_by_3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备用字段3  |
|  17   | u_bz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 个人信息备注  |

