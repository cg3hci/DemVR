data = ({
    name : "ECARulesLib",
    children: [
        {
            name: "Object",
            children: [
                {
                    name: "Character",
                    children: [
                        {
                            name: "Animal",
                            children: [
                                {name: "Aquatic Animal"},
                                {name: "Flying Animal"},
                                {name: "Terrestrial Animal"},
                            ]
                        },
                        {name: "Creature"},
                        {name: "Human"},
                        {name: "Robot"},
                    ]
                },
                {name: "Scene"},
                {
                    name: "Environment",
                    children: [
                        {name: "Art"},
                        {name: "Building"},
                        {name: "Exterior"},
                        {name: "Furniture"},
                        {name: "Sky"},
                        {name: "Vegetation"},
                        {name: "Terrain"}
                    ]
                },
                {
                    name: "Props",
                    children: [
                        {name: "Clothing"},
                        {name: "Electronic"},
                        {name: "Food"},
                        {
                            name: "Weapon",
                            children: [
                                {name: "Bullet"},
                                {name: "Edged Weapon"},
                                {name: "Firearm"},
                                {name: "Shield"},
                            ]
                        }
                    ]
                },
                {
                    name: "Vehicle",
                    children: [
                        {name: "Air Vehicle"},
                        {name: "Land Vehicle"},
                        {name: "Sea Vehicle"},
                        {name: "Space Vehicle"},
                    ]
                },
                {
                    name: "Interaction",
                    children: [
                        {name: "Bounds"},
                        {name: "Button"},
                        {name: "Camera"},
                        {name: "Image"},
                        {name: "Light"},
                        {name: "Text"},
                        {name: "Video"}
                    ],
                }
            ],
        },
        {
            name: "Behaviour",
            children : [
                {name: "Container"},
                {name: "Collectable"},
                {name: "Counter"},
                {name: "Keypad"},
                {name: "Lock"},
                {name: "Particle"},
                {name: "Placeholder"},
                {name: "Sound"},
                {name: "Switch"},
                {name: "Transition"},
                {name: "Trigger"},
                {name: "Timer"},

            ],
        },
    ],

});