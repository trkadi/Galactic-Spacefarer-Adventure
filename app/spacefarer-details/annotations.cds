using GalacticService from '../../srv/galactic-service';

/**
 * Fiori Design Guidelines - Object Page
 *  https://www.sap.com/design-system/fiori-design-web/v1-136/page-types/floorplans/object-page/usage
 * SAPUI5 SDK - OData V4 Annotations
 *  https://www.google.com/search?q=https://sapui5.hana.ondemand.com/sdk/%23/topic/5eb6f06852174643b9000ccf11f4d99c&authuser=1
 */

annotate GalacticService.Spacefarers with @(
    UI.HeaderInfo : {
        TypeName       : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title          : { Value : compositeObjectTitle },
        Description    : { Value : ID }
    },

    UI.DataPoint #StardustProgress : {
        Value : stardustCollection,
        TargetValue : 5000, // Max stardust
        Visualization : #Progress,
        Title : 'Stardust Collection',
    },

    UI.DataPoint #SkillProgress : {
        Value : wormholeNavigationSkill,
        TargetValue : 10, // Max skill
        Visualization : #Progress,
        Title : 'Navigation Skill',
    },

    UI.DataPoint #PositionRank : {
        Value : position.rank,
        TargetValue : 5,
        Visualization : #Rating,
        Title : 'Rank Level'
    },

    // --- OLDAL FELÉPÍTÉSE ---
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'GeneralInfoSection',
            Label  : 'Spacefarer Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Basic Vitals',
                    Target : '@UI.FieldGroup#Vitals',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Rank & Assignment',
                    Target : '@UI.FieldGroup#Deployment',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Performance Indicators',
                    Target : '@UI.FieldGroup#Stats', // Új szekció a progress baroknak
                },
            ],
        }
    ],

    // --- MEZŐCSOPORTOK ---
    UI.FieldGroup #Vitals : {
        Data : [
            { Value : originPlanet },
            { Value : spacesuitColor }
        ]
    },

    UI.FieldGroup #Deployment : {
        Data : [
            { Value : department_ID },
            { Value : position_ID },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#PositionRank',
                Label : 'Seniority Rank'
            }
        ]
    },

    // Ez a trükk: a FieldGroup-ba DataPoint-okat teszünk
    UI.FieldGroup #Stats : {
        Data : [
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#StardustProgress',
                Label : 'Stardust Collection'
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#SkillProgress',
                Label : 'Wormhole Navigation Mastery'
            }
        ]
    }
);
