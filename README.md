# 岗位评估与打招呼 Skill

一个面向中国招聘场景、适用于各行业和岗位的 Agent Skill。**把想投的岗位详情页截图和自己的简历发给它**，它会核查招聘主体，解释这份工作实际要做什么，再用简历证据判断匹配与缺口，给出投递建议和一版供审核的招聘平台打招呼草稿。

它的重点是把 **公司事实、JD 要求、个人经历和推断** 分开。不会把“岗位要求会做什么”自动写成“我做过什么”，也不会把“简历没写”直接判成“不会”。它只分析和拟稿，**不会代投递或发送消息**。

## 适合谁

正在使用 BOSS 直聘等中国招聘平台找工作的求职者，包括应届生、转行者和有工作经验的人。岗位可以来自不同的行业、职能和职级。对于需要执业资格、许可或特殊安全条件的岗位，skill 会单独核对门槛；资料不足时明确说明，不假装具备行业专家判断。

## 安装到 Codex

在 Codex 对话中调用内置的 `skill-installer`，请它从本仓库的 [`skills/hr-greeting`](skills/hr-greeting/SKILL.md) 目录安装：

> 使用 $skill-installer 从 https://github.com/liacc339/HR-greeting/tree/main/skills/hr-greeting 安装这个 skill。

安装后，如果技能没有立即出现在列表中，重启 Codex。也可以按所用工具的 [Agent Skills 安装说明](https://learn.chatgpt.com/docs/build-skills)，手动安装整个 `skills/hr-greeting` 文件夹；只复制 `SKILL.md` 会遗漏 Codex 的界面元数据。

## 安装到 WorkBuddy

1. 下载仓库中的 [`hr-greeting-workbuddy.zip`](packages/hr-greeting-workbuddy.zip) 到电脑上。
2. 在 WorkBuddy 左侧打开「专家·技能·连接器」→「技能」，点击「添加技能」→「上传技能」，选择下载的 ZIP 文件。导入后，可在「已安装」中查看。
3. 上传岗位详情页截图和简历，在对话中说：“使用 hr-greeting 分析这个岗位与我的匹配和缺口，并写一版打招呼草稿。”

这是 WorkBuddy 的**本地上传**方式，不代表本技能已上架 WorkBuddy 技能市场。操作入口依据 [WorkBuddy 官方技能说明](https://www.workbuddy.cn/docs/workbuddy/From-Beginner-to-Expert-Guide/Function-Description/Skills-Market)。是否能核查公司与最新职位信息，取决于你在 WorkBuddy 中可用的联网能力。

## 两步使用

1. **截图岗位详情页。** 尽量包含公司名称、岗位职责和任职要求；长页面可分几张截图。
2. **附上简历并调用 skill。** 简历可用 PDF、图片或文字。无需另填经历、薪资或偏好问卷。可以先遮住电话、住址等不影响判断的个人信息。

在 Codex 对话中点名 `$hr-greeting`，例如：

> 使用 $hr-greeting 分析我上传的岗位详情页截图和简历。

两份材料能读清时，skill 会直接开始。如果页面截断或简历缺少会改变结论的资格信息，它会说明具体缺什么；不会为了凑齐输入项反复提问。只提供岗位信息时，它仍能先分析岗位，但不能可靠判断个人匹配，也不会编造第一人称经历。

## 你会得到什么

| 部分 | 内容 |
| --- | --- |
| 公司与岗位 | 招聘主体、业务、公开可查的规模与融资等信息；岗位基本信息与来源限制 |
| JD 实际工作 | 逐条解释主要职责对应的工作对象、具体任务和结果，标出硬门槛与优先项 |
| 匹配与缺口 | 用简历证据区分直接实践、可迁移经历、真实缺口和信息不足 |
| 投递建议 | 建议投、选择性投或不建议投；若要投，指出简历可补充或调整的重点 |
| 打招呼草稿 | 与岗位相关、只使用已确认经历的一版消息，供你审核 |

如果学历、资格或经验等核心门槛明显不满足，skill 会直说“不建议投”，不会强行写一段像是符合该岗位的招呼。你仍可让它拟一段**询问实习、校招或其他岗位**的消息，并标清用途。若只需要其中一部分，可以直接说“只分析岗位”“只给匹配与缺口”或“只修改这段招呼”。

## 示例与使用边界

[`examples/README.md`](examples/README.md) 用虚构的设备维护、门店管理和资格门槛案例展示判断方法。公开示例不包含真实简历或聊天记录；请勿把真实电话、邮箱、未公开项目资料提交到公开仓库。

公司业务、职位是否仍在招聘、薪资和相关资格要求可能变化。联网时应优先核对招聘原页、公司官方资料和适用的权威信息；无法核实时，skill 会限定结论的依据。输出不保证获得回复、面试或录用。真正发送前，请自己核对简历事实、岗位信息和招呼措辞。

## 项目文件

- [`skills/hr-greeting/SKILL.md`](skills/hr-greeting/SKILL.md)：完整工作规则。
- [`skills/hr-greeting/agents/openai.yaml`](skills/hr-greeting/agents/openai.yaml)：Codex 中的显示名称和默认提示。
- [`packages/hr-greeting-workbuddy.zip`](packages/hr-greeting-workbuddy.zip)：用于 WorkBuddy 本地上传的技能包。
- [`examples/README.md`](examples/README.md)：虚构案例。
- [`LICENSE`](LICENSE)：MIT 许可证。

欢迎提交 issue 反馈判断错误、岗位类型遗漏或不清楚的使用步骤。反馈前请脱敏。这个仓库公开的是通用版，不包含任何个人简历或私人版 skill。
