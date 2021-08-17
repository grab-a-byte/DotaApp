const itemsJson = '''
{
  "1": {
    "id": 1,
    "name": "item_blink",
    "displayName": "Blink Dagger",
    "shortName": "blink",
    "language": {
      "displayName": "Blink Dagger",
      "lore": [
        "The fabled dagger used by the fastest assassin ever to walk the lands."
      ],
      "description": [
        "<h1>Active: Blink</h1> Teleport to a target point up to 1200 units away. <br><br>Blink Dagger cannot be used for 3.0 seconds after taking damage from an enemy hero or Roshan."
      ],
      "notes": [
        "Self-casting will cause you to teleport in the direction of your team's fountain.",
        "If you used Blink to teleport to a distance over the maximum range, you'll be teleported 4/5 of the maximum range instead."
      ],
      "attributes": []
    },
    "stat": {
      "behavior": 5136,
      "unitTargetType": 0,
      "unitTargetTeam": 0,
      "unitTargetFlags": 0,
      "fightLevelRecap": 0,
      "castRange": [
        0
      ],
      "castPoint": [
        0.0
      ],
      "cooldown": [
        15.0
      ],
      "manaCost": [
        0.0
      ],
      "sharedCooldown": "blink",
      "cost": 2250,
      "shopTags": "teleport",
      "aliases": "blink dagger",
      "quality": "component",
      "isSellable": true,
      "isDroppable": true,
      "isPurchaseable": true,
      "isSecretShop": false,
      "isSideShop": false,
      "isStackable": false,
      "isPermanent": false,
      "isHideCharges": false,
      "isRequiresCharges": false,
      "isDisplayCharges": false,
      "isSupport": false,
      "isTempestDoubleClonable": false,
      "stockMax": 0,
      "initialCharges": 0,
      "initialStock": 0,
      "stockTime": 0,
      "initialStockTime": 0,
      "isRecipe": false,
      "needsComponents": false
    },
    "image": "blink_lg.png?3",
    "isInNeuralNetwork": true,
    "isFullItemHeroPurchaseItem": true
  },
  "2": {
    "id": 2,
    "name": "item_blades_of_attack",
    "displayName": "Blades of Attack",
    "shortName": "blades_of_attack",
    "language": {
      "displayName": "Blades of Attack",
      "lore": [
        "The damage of these small, concealable blades should not be underestimated."
      ],
      "description": [],
      "notes": [],
      "attributes": [
        "+9 Damage"
      ]
    },
    "stat": {
      "behavior": 2,
      "unitTargetType": 0,
      "unitTargetTeam": 0,
      "unitTargetFlags": 0,
      "fightLevelRecap": 0,
      "sharedCooldown": "",
      "cost": 450,
      "shopTags": "damage;tutorial",
      "aliases": "blades of attack",
      "quality": "component",
      "isSellable": true,
      "isDroppable": true,
      "isPurchaseable": true,
      "isSecretShop": false,
      "isSideShop": false,
      "isStackable": false,
      "isPermanent": false,
      "isHideCharges": false,
      "isRequiresCharges": false,
      "isDisplayCharges": false,
      "isSupport": false,
      "isTempestDoubleClonable": false,
      "stockMax": 0,
      "initialCharges": 0,
      "initialStock": 0,
      "stockTime": 0,
      "initialStockTime": 0,
      "isRecipe": false,
      "needsComponents": false
    },
    "image": "blades_of_attack_lg.png?3",
    "isInNeuralNetwork": false,
    "isFullItemHeroPurchaseItem": false
  }
}
''';
