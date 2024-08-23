extends Node
class_name QuestManager

var quests: Array[Quest] = []

func add_quest(quest: Quest):
	notify_quest_update()
	quests.append(quest)

func notify_quest_update():
	var i = 0
	while i < len(quests):
		if quests[i].status == Quest.QuestStatus.Completed:
			quests.remove_at(i)
			i -= 1
		i += 1
