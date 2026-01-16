using GalacticService from '../../srv/galactic-service';

/**
 * Fiori Design Guidelines - Object Page
 *  https://www.sap.com/design-system/fiori-design-web/v1-136/page-types/floorplans/object-page/usage
 * SAPUI5 SDK - OData V4 Annotations
 *  https://www.google.com/search?q=https://sapui5.hana.ondemand.com/sdk/%23/topic/5eb6f06852174643b9000ccf11f4d99c&authuser=1
 */

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
