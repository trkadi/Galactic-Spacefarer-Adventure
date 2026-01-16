using { galactic } from '../db/galactic-schema';

@path: 'service/galactic'
@requires: 'authenticated-user'
service GalacticService {

    @odata.draft.enabled
    @restrict: [
        { grant: '*', to: 'SpacefarerManager' },
        { grant: 'READ', to: 'Spacefarer', where: 'originPlanet = $user.planet' }
    ]
    entity Spacefarers as projection on galactic.Spacefarers {
        *,
        spacesuitColor || ' - ' || department.name || ' - ' || position.title as compositeObjectTitle : String
    };

    @readonly
    @cds.autoexpose
    @restrict: [
        { grant: 'READ', to: ['SpacefarerManager', 'Spacefarer'] }
    ]
    entity Departments as projection on galactic.Departments;

    @readonly
    @cds.autoexpose
    @restrict: [
        { grant: 'READ', to: ['SpacefarerManager', 'Spacefarer'] }
    ]
    entity Positions as projection on galactic.Positions;
}
