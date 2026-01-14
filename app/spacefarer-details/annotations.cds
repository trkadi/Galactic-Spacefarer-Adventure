using GalacticService from '../../srv/galactic-service';

annotate GalacticService.Spacefarers with @(
    // HEADER
    UI.HeaderInfo : {
        TypeName       : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title          : { Value : originPlanet },
        Description    : { Value : spacesuitColor }
    },

    // HEADER FACETS
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#Stardust',
        }
    ],

    UI.DataPoint #Stardust : {
        Value : stardustCollection,
        Title : 'Current Stardust',
    },

    // SECTIONS
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'GeneralInformation',
            Label  : 'General Information',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'Spacefarer Profile',
                    Target : '@UI.FieldGroup#Profile',
                }
            ],
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Military & Service Info',
            Target : '@UI.FieldGroup#Service',
        }
    ],

    UI.FieldGroup #Profile : {
        Data : [
            { Value : originPlanet },
            { Value : spacesuitColor },
        ]
    },

    UI.FieldGroup #Service : {
        Data : [
            { Value : wormholeNavigationSkill },
            { Value : department_ID },
            { Value : position_ID },
        ]
    }
);
