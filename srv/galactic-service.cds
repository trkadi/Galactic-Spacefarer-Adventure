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
    entity Departments as projection on galactic.Departments;

    @readonly
    @cds.autoexpose
    entity Positions as projection on galactic.Positions;
}
