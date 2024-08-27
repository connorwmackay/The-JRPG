extends Node
class_name DialogueTree
## Used to store a dialogue tree that will be played under certain conditions.
## 
## Any DialogueItem nodes that are children of this node will be used for the
## dialogue, in the order they appear.

## The Name For The Dialogue Tree (Will be Used As an ID by NPC, Quests etc.)
@export var tree_name: String = "base"
