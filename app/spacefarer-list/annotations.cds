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

    // Filters
    UI.SelectionFields : [
        originPlanet,
        department_ID,
        position_ID
    ],

    // Table columns
    UI.LineItem : [
        { Value : ID },
        { Value : spacesuitColor },
        { Value : stardustCollection },
    ]
);

annotate GalacticService.Spacefarers with {
    department @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Departments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : department_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        }
    );

    position @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Positions',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : position_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
            ],
        }
    );
}
