extends CardSelector
class_name CampaignSelector

const CampaignCard = preload("res://source/interface/menus/components/cards/CampaignCard.tscn")

func _ready() -> void:
	for campaign in Registry.campaigns:
		_add_campaign(campaign)

func _add_campaign(campaign) -> void:
	var file_data : Dictionary = Registry.campaigns[campaign]
	var button := CampaignCard.instance()
	button.connect("pressed", self, "_on_campaign_card_pressed", [campaign])
	card_container.add_child(button)
	button.initialize(file_data.data)

func _on_campaign_card_pressed(id) -> void:
	print(id, " selected; loading Campaign")