WF_QuestTools.lastQuestAdded = 0

WF_QuestTools.QuestsToAbandon = {}
WF_QuestTools.QuestsToShare = {}

WF_QuestTools.Filter = {
	Override = false,
	Worthless = { ["r"] = .65, ["g"] = .65, ["b"] = .65},
	Easy = { ["r"] = .65, ["g"] = 1, ["b"] = .65},
	Par = { ["r"] = .8, ["g"] = .8, ["b"] = .35},
	Difficult = { ["r"] = .8, ["g"] = .8, ["b"] = .35},
	Hard = { ["r"] = 1, ["g"] = .65, ["b"] = .65},
	Sort = true,
	Details = true,
	DetailsRollover = false,
}
WF_QuestTools.FilterDefaults = WF_QuestTools.Filter

WF_QuestTools.Zone = {
	Font = "Univers 57",
	Style = "soft-shadow-thin",
	Size = 22,
	Color = { ["r"] = .85, ["g"] = .85, ["b"] = .65},
	Counter = { ["r"] = .35, ["g"] = .65, ["b"] = 1},
	CounterSize = 14
}
WF_QuestTools.ZoneDefaults = WF_QuestTools.Zone

WF_QuestTools.Title = {
	Font = "Univers 57",
	Style = "soft-shadow-thin",
	Size = 16
}
WF_QuestTools.TitleDefaults = WF_QuestTools.Title

WF_QuestTools.Body = {
	Font = "Univers 57",
	Style = "soft-shadow-thin",
	Size = 13
}
WF_QuestTools.BodyDefaults = WF_QuestTools.Body

WF_QuestTools.Background = {
	r = 0,
	b = 0,
	g = 0,
	a = 0,
	out = 0.85,
	width = 250,
	barColor = {
		r = 0,
		g = 0,
		b = 0,
		a = 0
	},
}
WF_QuestTools.BackgroundDefaults = WF_QuestTools.Background