using { galactic } from '../db/galactic-schema';

@path: 'service/galactic'
@requires: 'authenticated-user'
service GalacticService {

    @restrict: [
        { grant: '*', to: 'SpacefarerManager' },
        { grant: 'READ', to: 'Spacefarer', where: 'originPlanet = $user.planet' }
    ]
    entity Spacefarers as projection on galactic.Spacefarers;

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
