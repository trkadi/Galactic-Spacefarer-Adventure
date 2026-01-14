using { galactic } from '../db/galactic-schema';

@path: 'service/galactic'
@requires: 'authenticated-user'
service GalacticService {

    entity Spacefarers as projection on galactic.Spacefarers;
    // restrict [
    //     { grant: '*', where: 'originPlanet = $user.planet' }
    // ];

    @readonly
    @cds.autoexpose
    entity Departments as projection on galactic.Departments;

    @readonly
    @cds.autoexpose
    entity Positions as projection on galactic.Positions;
}
