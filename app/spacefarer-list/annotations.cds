using GalacticService from '../../srv/galactic-service';

annotate GalacticService.Spacefarers with @(
    UI.PresentationVariant : {
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : stardustCollection,
                Descending : true,
            },
        ],
        Visualizations : ['@UI.LineItem'],
    },

    UI.SelectionFields : [
        originPlanet,
        department_ID,
        position_ID
    ],

    UI.LineItem : [
        {
            Value : spacesuitColor,
            Label : 'Spacesuit Color'
        },

        {
            Value : stardustCollection,
            Label : 'Stardust Status'
        },

        { Value : originPlanet, Label : 'Origin Planet', @Common.Text : originPlanet.name },
        { Value : department_ID, Label : 'Department' },
        { Value : position_ID, Label : 'Position' }
    ]
);

annotate GalacticService.Spacefarers with {
    department @(
        Common.Label : 'Department',

        // Change to dropdown
        Common.ValueListWithFixedValues : true,

        // Display the title instead of the ID
        Common.Text : department.name,
        Common.TextArrangement : #TextOnly,

        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Departments',
            Parameters : [
                { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : department_ID, ValueListProperty : 'ID' },
                { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'name' },
            ],
        }
    );
    position @(
        Common.Label : 'Position',
        Common.ValueListWithFixedValues : true,
        Common.Text : position.title,
        Common.TextArrangement : #TextOnly,

        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Positions',
            Parameters : [
                { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : position_ID, ValueListProperty : 'ID' },
                { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'title' },
            ],
        }
    );
    originPlanet @(
        Common.Label : 'Origin Planet',
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Spacefarers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : originPlanet,
                    ValueListProperty : 'originPlanet'
                }
            ]
        }
    );
}

// Force displaying only text for filters
annotate GalacticService.Departments with {
    ID @Common.Text : name @Common.TextArrangement : #TextOnly;
}

annotate GalacticService.Positions with {
    ID @Common.Text : title @Common.TextArrangement : #TextOnly;
}
