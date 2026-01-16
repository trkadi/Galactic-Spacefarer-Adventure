namespace galactic;

using { managed, cuid } from '@sap/cds/common';

entity Spacefarers : managed, cuid {
    stardustCollection      : Integer default 0;
    wormholeNavigationSkill : Integer not null;

    @assert.range
    originPlanet            : Planet not null;

    spacesuitColor          : String default 'Standard White';

    @assert.target
    department              : Association to Departments not null;

    @assert.target
    position                : Association to Positions not null;
}

entity Departments : managed, cuid {
    name        : String not null;
    description : String default 'No description provided';
    spacefarers : Association to many Spacefarers on spacefarers.department = $self;
}

entity Positions : managed, cuid {
    title       : String not null;
    rank        : Integer not null;
    spacefarers : Association to many Spacefarers on spacefarers.position = $self;
}

type Planet : String enum {
  Planet_X = 'Planet X';
  Planet_Y = 'Planet Y';
}
