using GalacticService from '../../srv/galactic-service';

annotate GalacticService.Spacefarers with @(
    // Filters
    UI.SelectionFields : [
        originPlanet,
        department_ID,
        position_ID
    ],

    // Table columns
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Identifier',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Spacesuit Color',
            Value : spacesuitColor,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stardust Collection',
            Value : stardustCollection,
        }
    ]
);
