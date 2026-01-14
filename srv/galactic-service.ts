import { Spacefarer } from '#cds-models/galactic';
import cds, { Request } from '@sap/cds';

// Outsource "magic" literals
const CONFIG = {
    SKILL: { MIN: 1, MAX: 10, BONUS_THRESHOLD: 8 },
    REWARDS: { STARDUST_BONUS: 1000 },
    DEFAULTS: { COLOR: 'Standard White' }
};

// Use the built in logger - shows prefix and is searchable
const LOG = cds.log('galactic-service');

export default class GalacticService extends cds.ApplicationService {

    // NOTE: CAP framework expects async fns (non-blocking methodology)
    async init() {
        this.before('CREATE', 'Spacefarers', this.onBeforeCreateSpacefarer);
        this.after('CREATE', 'Spacefarers', this.onAfterCreateSpacefarer);
        return super.init();
    }

    // NOTE: CAP framework expects async fns (non-blocking methodology)
    async onBeforeCreateSpacefarer(req: Request<Spacefarer>) {
        // NOTE: Value of this: dynamic (named function) = db transaction - safe to use
        const {data: spacefarer} = req;
        this.validateNavigationSkill(req, spacefarer);
        this.applyBonusRules(spacefarer);
        this.applyDefaults(spacefarer);
    }

    // NOTE: CAP framework expects async fns (non-blocking methodology)
    // NOTE: CAP typing expects any | any[] for results!
    async onAfterCreateSpacefarer(results: Spacefarer | Spacefarer[], req: Request) {
        const items = Array.isArray(results) ? results : [results];
        items.forEach(item => this.sendWelcomeEmail(item));
    }

    // --------------------------------
    // ---- Private Helper Methods ----
    // --------------------------------
    private validateNavigationSkill(req: Request, data: Spacefarer): void {
        const { MIN, MAX } = CONFIG.SKILL;

        if (data.wormholeNavigationSkill !== undefined) {
             if (data.wormholeNavigationSkill < MIN || data.wormholeNavigationSkill > MAX) {
                req.error(400, `Skill must be between ${MIN} and ${MAX}`, 'in/wormholeNavigationSkill');
            }
        }
    }

    private applyBonusRules(data: Spacefarer): void {
        if (data.wormholeNavigationSkill && data.wormholeNavigationSkill > CONFIG.SKILL.BONUS_THRESHOLD) {
            data.stardustCollection = (data.stardustCollection || 0) + CONFIG.REWARDS.STARDUST_BONUS;
            LOG.info(`Bonus applied for high skill: +${CONFIG.REWARDS.STARDUST_BONUS}`);
        }
    }

    private applyDefaults(data: Spacefarer): void {
        if (!data.spacesuitColor) {
            data.spacesuitColor = CONFIG.DEFAULTS.COLOR;
            LOG.debug('Default spacesuit color applied');
        }
    }

    private sendWelcomeEmail(item: Spacefarer): void {
        if (!item) return;

        LOG.info('--- MOCK EMAIL START ---');
        LOG.info(`To: Spacefarer(${item.ID})`);
        LOG.info(`Subject: Welcome from ${item.originPlanet}!`);

        if (item.stardustCollection && item.stardustCollection >= 1000) {
            LOG.info('Tag: #HighPotentialRecruit');
        }
        LOG.info('--- MOCK EMAIL END ---');
    }
}
